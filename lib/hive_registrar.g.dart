import 'package:hive_ce/hive.dart';
import 'package:friendly_feud/models/feud.dart';
import 'package:friendly_feud/models/foe.dart';
import 'package:friendly_feud/models/skirmish.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(FeudAdapter());
    registerAdapter(FoeAdapter());
    registerAdapter(SkirmishAdapter());
  }
}
