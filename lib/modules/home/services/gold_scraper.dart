import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'dart:convert';
import 'dart:io';
import '../home_exports.dart';

class GoldRateScraper {
  static const String url =
      'https://groww.in/gold-rates/gold-rate-today-in-mumbai';

  Future<List<GoldRate>> scrapeGoldRates() async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load webpage');
      }

      final document = parser.parse(response.body);
      final goldRateDivs = document.getElementsByClassName(
          'grp846CardDiv backgroundPrimary borderPrimary valign-wrapper vspace-between');

      return goldRateDivs.map((div) {
        final text = div.text.trim().replaceAll(RegExp(r'\s+'), ' ').split(' ');

        // Extract rate (removing ₹ symbol)
        final rateStr = text[5].replaceAll('\'24₹', '');
        final rate = double.parse(rateStr);

        // Extract fluctuation (removing parentheses)
        final fluctuation = text.last;

        return GoldRate(
          purity: text[0],
          date:
              '${DateTime.now().year}', // Using current year since it's not in the text
          currency: 'INR',
          ratePerTenGm: rate,
          ratePerGm: double.parse((rate / 10).toStringAsFixed(4)),
          fluctuation: fluctuation,
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> writeJsonFile(List<GoldRate> rates) async {
    final file = File('gold_rates.json');
    final jsonData = rates.map((rate) => rate.toJson()).toList();
    await file.writeAsString(json.encode(jsonData));
  }

  Future<void> main() async {
    await Future.delayed(Duration(seconds: 2));
    final goldRates = await scrapeGoldRates();

    if (goldRates.isNotEmpty) {
      await writeJsonFile(goldRates);
    } else {
      // print('Failed to retrieve gold rates');
      // TODO: Add error handling logic here
    }
  }
}
