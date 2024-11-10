import 'package:hive_ce/hive.dart';

part 'foe.g.dart';

@HiveType(typeId: 1)
class Foe {
  const Foe({
    required this.name,
  });
  @HiveField(0)
  final String name;
}
