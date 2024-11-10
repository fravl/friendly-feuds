import 'package:hive_ce/hive.dart';

import '../models/feud.dart';

class FeudService {
  final storage = Hive.box("storage");

  Map<String, Feud> get feuds {
    return Map<String, Feud>.from(storage.get('feuds') ?? {});
  }

  void addFeud(Feud feud) {
    final currentFeuds = feuds;
    currentFeuds[feud.id] = feud;
    storage.put('feuds', currentFeuds);
  }

  Feud? getFeudById(String id) {
    return feuds[id];
  }

  void updateFeud(String id, Feud updatedFeud) {
    final currentFeuds = feuds;
    if (currentFeuds.containsKey(id)) {
      currentFeuds[id] = updatedFeud;
      storage.put('feuds', currentFeuds);
    }
  }
}
