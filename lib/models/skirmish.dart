import 'foe.dart';

class Skirmish {
  final DateTime date;
  final Map<Foe, int> results;

  Skirmish({required this.results, DateTime? date})
      : date = date ?? DateTime.now();
}
