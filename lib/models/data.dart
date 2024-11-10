import 'feud.dart';
import 'foe.dart';
import 'skirmish.dart';

const foe1 = Foe(name: 'Alice');
const foe2 = Foe(name: 'Bob');
const foe3 = Foe(name: 'Charlie');
const foe4 = Foe(name: 'Diana');

var skirmish1 = Skirmish(
  date: DateTime(2023, 5, 12),
  results: {
    foe1: 20,
    foe2: 18,
  },
);

var skirmish2 = Skirmish(
  date: DateTime(2023, 6, 24),
  results: {
    foe1: 15,
    foe3: 21,
  },
);

var skirmish3 = Skirmish(
  date: DateTime(2023, 7, 15),
  results: {
    foe2: 25,
    foe3: 17,
    foe4: 22,
  },
);

var skirmish4 = Skirmish(
  date: DateTime(2023, 8, 5),
  results: {
    foe1: 10,
    foe2: 20,
    foe4: 19,
  },
);

final boardGameFeud = Feud(
  name: 'Board Game Bonanza',
  foes: [foe1, foe2, foe3, foe4],
  skirmishes: [skirmish1, skirmish2, skirmish3, skirmish4],
);

final pubQuizFeud = Feud(
  name: 'Pub Quiz Rivalry',
  foes: [foe1, foe2],
  skirmishes: [
    Skirmish(
      date: DateTime(2023, 4, 20),
      results: {
        foe1: 30,
        foe2: 28,
      },
    ),
    Skirmish(
      date: DateTime(2023, 5, 1),
      results: {
        foe1: 24,
        foe2: 26,
      },
    ),
  ],
);

final allFeuds = [boardGameFeud, pubQuizFeud];
