import 'package:flutter/material.dart';

class InfoTiles extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoTiles(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  State<InfoTiles> createState() => _InfoTilesState();
}

class _InfoTilesState extends State<InfoTiles> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      subtitle: Text(widget.subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
      tileColor: Theme.of(context).colorScheme.secondary,
      leading: Icon(
        widget.icon,
        size: MediaQuery.of(context).size.width * 0.068,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
