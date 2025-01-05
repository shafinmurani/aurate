import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Sale',
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
      body: ListView(
        children: [
          Divider(),
          ListTile(
            onTap: () {
              context.go("/gold-coin");
            },
            leading: Icon(LineIcons.coins),
            title: Text("Gold Coin"),
            subtitle: Text("24K"),
          ),
          ListTile(
            onTap: () {
              context.go("/gold-jewellery");
            },
            leading: Icon(LineIcons.ring),
            title: Text("Gold Jewellery"),
            subtitle: Text("22K"),
          ),
        ],
      ),
    );
  }
}
