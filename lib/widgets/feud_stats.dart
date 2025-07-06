import 'package:flutter/material.dart';
import '../models/feud.dart';
import '../models/feud_stat.dart';

class FeudStats extends StatelessWidget {
  final Feud feud;

  const FeudStats({super.key, required this.feud});

  @override
  Widget build(BuildContext context) {
    if (feud.skirmishes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No stats yet — play some skirmishes!'),
      );
    }

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Feud Stats',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 20,
              runSpacing: 12,
              children: [
                _StatItem(
                  label: "Most Wins",
                  value: feud.mostWins,
                  icon: Icons.emoji_events,
                ),
                _StatItem(
                  label: "Highest Score",
                  value: feud.highestScore,
                  icon: Icons.trending_up,
                ),
                _StatItem(
                  label: "Longest Streak",
                  value: feud.longestWinStreak,
                  icon: Icons.stacked_line_chart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final FeudStat value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var valueString =
        '${value.scorers.map((f) => f.name).join(' & ')} (${value.stat})';

    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blueGrey, size: 28),
          const SizedBox(height: 4),
          Text(
            valueString,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
