import 'package:uuid/uuid.dart';
import 'package:hive_ce/hive.dart';

import 'feud_stat.dart';
import 'foe.dart';
import 'skirmish.dart';

part 'feud.g.dart';

@HiveType(typeId: 0)
class Feud {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<Foe> foes;
  @HiveField(3)
  final List<Skirmish> skirmishes;

  Feud({
    String? id,
    required this.name,
    this.foes = const [],
    this.skirmishes = const [],
  }) : id = id ?? const Uuid().v4();

  FeudStat get mostWins {
    if (skirmishes.isEmpty) {
      return FeudStat(stat: "0", scorers: {});
    }
    final winCounts = <Foe, int>{};
    for (var skirmish in skirmishes) {
      if (skirmish.results.isEmpty) continue;
      final topScore = skirmish.sortedResults.first.value;
      for (var entry in skirmish.results.entries) {
        if (entry.value == topScore) {
          winCounts[entry.key] = (winCounts[entry.key] ?? 0) + 1;
        }
      }
    }
    if (winCounts.isEmpty) {
      return FeudStat(stat: "0", scorers: {});
    }
    final maxWins = winCounts.values.reduce((a, b) => a > b ? a : b);
    final winners = winCounts.entries
        .where((e) => e.value == maxWins)
        .map((e) => e.key)
        .toSet();
    return FeudStat(stat: "$maxWins", scorers: winners);
  }

  FeudStat get highestScore {
    int highScore = 0;
    Set<Foe> scorers = {};
    for (var skirmish in skirmishes) {
      for (var entry in skirmish.results.entries) {
        if (entry.value > highScore) {
          highScore = entry.value;
          scorers = {entry.key};
        } else if (entry.value == highScore && highScore != 0) {
          if (!scorers.contains(entry.key)) {
            scorers.add(entry.key);
          }
        }
      }
    }
    return FeudStat(
      stat: highScore > 0 ? "$highScore" : "0",
      scorers: scorers,
    );
  }

  FeudStat get longestWinStreak {
    final streaks = <Foe, int>{};
    final maxStreaks = <Foe, int>{};
    for (var foe in foes) {
      streaks[foe] = 0;
      maxStreaks[foe] = 0;
    }
    for (var skirmish in skirmishes) {
      if (skirmish.results.isEmpty) continue;
      final topScore = skirmish.sortedResults.first.value;
      final winners = skirmish.sortedResults
          .where((e) => e.value == topScore)
          .map((e) => e.key)
          .toList();
      for (var foe in foes) {
        if (winners.contains(foe)) {
          streaks[foe] = (streaks[foe] ?? 0) + 1;
          if ((streaks[foe] ?? 0) > (maxStreaks[foe] ?? 0)) {
            maxStreaks[foe] = streaks[foe]!;
          }
        } else {
          streaks[foe] = 0;
        }
      }
    }
    final max = maxStreaks.values.isNotEmpty
        ? maxStreaks.values.reduce((a, b) => a > b ? a : b)
        : 0;
    final streakFoes = maxStreaks.entries
        .where((e) => e.value == max && max > 0)
        .map((e) => e.key)
        .toSet();

    return FeudStat(
      stat: max > 0 ? "$max" : "0",
      scorers: streakFoes,
    );
  }
}
