import 'package:flutter/material.dart';

class LivePrices extends StatefulWidget {
  const LivePrices({super.key});

  @override
  State<LivePrices> createState() => _LivePricesState();
}

class _LivePricesState extends State<LivePrices> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 16.0,
            children: [
              Text(
                'Live Prices',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text('[price]',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
