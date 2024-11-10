import 'package:flutter/material.dart';
import 'package:friendly_feud/widgets/feud_card.dart';

import '../models/feud.dart';

class FeudList extends StatelessWidget {
  final List<Feud> feuds;

  const FeudList({super.key, required this.feuds});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
            children: feuds
                .map((feud) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: FeudCard(feud: feud)))
                .toList()));
  }
}
