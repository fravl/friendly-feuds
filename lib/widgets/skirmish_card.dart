import 'package:flutter/material.dart';

import '../models/skirmish.dart';

class SkirmishCard extends StatelessWidget {
  final Skirmish skirmish;

  const SkirmishCard({super.key, required this.skirmish});

  @override
  Widget build(BuildContext context) {
    var sortedResults = skirmish.sortedResults;
    int highestScore = sortedResults.first.value;

    String subtitle = '';
    List<String> highlights = [];

    for (var entry in sortedResults) {
      String participantScore = '${entry.key.name}: ${entry.value}';
      if (entry.value == highestScore) {
        highlights.add(participantScore);
      } else {
        subtitle += '$participantScore\n';
      }
    }

    subtitle += 'Winner(s): ${highlights.join(' & ')}';

    return Card(
      child: ListTile(
        title: Text(
          skirmish.date.toLocal().toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontWeight: highestScore == sortedResults.first.value
                ? FontWeight.bold
                : FontWeight.normal,
            color: highestScore == sortedResults.first.value
                ? Colors.deepOrange
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
