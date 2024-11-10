import 'package:flutter/material.dart';

import '../models/feud.dart';

class FeudCard extends StatelessWidget {
  final Feud feud;

  const FeudCard({super.key, required this.feud});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(feud.name),
      contentPadding: const EdgeInsets.all(16.0),
      subtitle: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Tooltip(
            message: "Foes",
            child: Row(children: [
              const Icon(Icons.people),
              const SizedBox(width: 4),
              Text(
                feud.foes.length.toString(),
              ),
            ])),
        const SizedBox(width: 8),
        Tooltip(
            message: "Skirmishes",
            child: Row(children: [
              const Icon(Icons.sports_mma),
              const SizedBox(width: 4),
              Text(
                feud.skirmishes.length.toString(),
              ),
            ]))
      ]),
    ));
  }
}
