import 'foe.dart';
import 'package:hive_ce/hive.dart';

part 'skirmish.g.dart';

@HiveType(typeId: 2)
class Skirmish {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final Map<Foe, int> results;

  Skirmish({required this.results, DateTime? date})
      : date = date ?? DateTime.now();

  List<MapEntry<Foe, int>> get sortedResults {
    var sorted = results.entries.toList();
    sorted.sort((a, b) => b.value.compareTo(a.value));
    return sorted;
  }
}
