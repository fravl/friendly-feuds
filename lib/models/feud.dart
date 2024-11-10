import 'package:uuid/uuid.dart';
import 'package:hive_ce/hive.dart';

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

  Feud({required this.name, this.foes = const [], this.skirmishes = const []})
      : id = const Uuid().v4();
}
