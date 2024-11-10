import 'foe.dart';
import 'skirmish.dart';

class Feud {
  final String name;
  final List<Foe> foes;
  final List<Skirmish> skirmishes;

  Feud({required this.name, this.foes = const [], this.skirmishes = const []});
}
