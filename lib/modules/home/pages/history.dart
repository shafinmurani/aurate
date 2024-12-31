import 'package:flutter/material.dart';
import '../home_exports.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.chevron_left,
            )),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => HistoryTile(
          name: "[name]",
          description: "[description]",
          price: 10000,
        ),
        shrinkWrap: true,
        padding: EdgeInsets.all(16.0),
        itemCount: 10, //change this when implementing backend logic
      ),
    );
  }
}
