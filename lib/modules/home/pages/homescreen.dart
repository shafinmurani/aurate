import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../export.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final scraper = GoldRateScraper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Aurate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                context.go('/history');
              },
              iconSize: 28.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              'Hello, ${FirebaseAuth.instance.currentUser?.displayName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 12,
            ),
            TodaysSale(),
            SizedBox(
              height: 12,
            ),
            Text(
              'Live Gold Rates',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 12,
            ),
            FutureBuilder(
              future: scraper.scrapeGoldRates(),
              builder: (context, snapshot) {
                return Row(
                  spacing: 16.0,
                  children: [
                    LivePrices(
                      goldRate: snapshot.data?.first,
                    ),
                    LivePrices(
                      goldRate: snapshot.data?.last,
                    ),
                  ],
                );
              },
            ),
            //TODO:graph here
          ],
        ),
      ),
    );
  }
}
