import 'package:flutter/material.dart';

class TodaysSale extends StatefulWidget {
  const TodaysSale({super.key});

  @override
  State<TodaysSale> createState() => _TodaysSaleState();
}

class _TodaysSaleState extends State<TodaysSale> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          children: [
            Text(
              'Today\'s Sale',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text('[price]',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),
          ],
        ),
      ),
    );
  }
}
