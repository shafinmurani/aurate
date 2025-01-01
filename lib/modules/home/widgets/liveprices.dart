import 'package:aurate/export.dart';
import 'package:flutter/material.dart';
import '../home_exports.dart';

class LivePrices extends StatefulWidget {
  final GoldRate? goldRate;
  const LivePrices({super.key, required this.goldRate});

  @override
  State<LivePrices> createState() => _LivePricesState();
}

class _LivePricesState extends State<LivePrices> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 16.0,
            children: widget.goldRate?.ratePerTenGm == null
                ? [CircularProgressIndicator()]
                : [
                    Text(
                      '${widget.goldRate?.purity} ${widget.goldRate?.element} ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text('₹${widget.goldRate?.ratePerTenGm} / 10gm',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ],
          ),
        ),
      ),
    );
  }
}
