import 'package:flutter/material.dart';
import '../../../export.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 32,
          ),
          Text(
            'Hello, [User]',
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
            'Live Prices',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            spacing: 16.0,
            children: [
              LivePrices(),
              LivePrices(),
            ],
          ),
          //TODO:graph here
        ],
      ),
    );
  }
}
