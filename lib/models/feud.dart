import 'foe.dart';
import 'skirmish.dart';
import 'package:hive_ce/hive.dart';

part 'feud.g.dart';

@HiveType(typeId: 0)
class Feud {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<Foe> foes;
  @HiveField(2)
  final List<Skirmish> skirmishes;

  Feud({required this.name, this.foes = const [], this.skirmishes = const []});
}
