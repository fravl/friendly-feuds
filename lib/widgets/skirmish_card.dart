import 'package:flutter/material.dart';
import '../models/skirmish.dart';

class SkirmishCard extends StatelessWidget {
  final Skirmish skirmish;

  const SkirmishCard({super.key, required this.skirmish});

  @override
  Widget build(BuildContext context) {
    final sortedResults = skirmish.sortedResults;
    final highestScore =
        sortedResults.isNotEmpty ? sortedResults.first.value : null;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${skirmish.date.toLocal()}'.split(' ')[0],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...sortedResults.map((entry) => Row(
                  children: [
                    if (highestScore != null && entry.value == highestScore)
                      const Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Icon(Icons.emoji_events,
                            color: Colors.amber, size: 20),
                      )
                    else
                      const SizedBox(width: 26), // to align rows
                    Text(
                      '${entry.key.name}: ',
                      style: TextStyle(
                        fontWeight: entry.value == highestScore
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    Text(
                      '${entry.value}',
                      style: TextStyle(
                        fontWeight: entry.value == highestScore
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
