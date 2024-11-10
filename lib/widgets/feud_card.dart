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
            subtitle: Text(
                "Foes: ${feud.foes.length}, Skirmishes: ${feud.skirmishes.length}")));
  }
}
