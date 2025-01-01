import 'package:flutter/material.dart';

class HistoryTile extends StatefulWidget {
  final String name;
  final String description;
  final double price;
  const HistoryTile(
      {super.key,
      required this.name,
      required this.description,
      required this.price});

  @override
  State<HistoryTile> createState() => _HistoryTileState();
}

class _HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        tileColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          widget.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        subtitle: Text(
          widget.description,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        trailing: Text(
          widget.price.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
