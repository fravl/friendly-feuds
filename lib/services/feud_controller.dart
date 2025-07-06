import 'package:friendly_feud/models/data.dart';
import 'package:friendly_feud/services/feud_service.dart';
import 'package:get/get.dart';

import '../models/feud.dart';
import '../models/skirmish.dart';

class FeudController {
  final feudService = Get.find<FeudService>();

  RxMap<String, Feud> feuds;

  FeudController() : feuds = <String, Feud>{}.obs {
    feuds.value = feudService.feuds;
  }

  void init() {
    allFeuds.forEach(addFeud);
  }

  void addFeud(Feud feud) {
    feuds[feud.id] = feud;
    feudService.addFeud(feud);
  }

  void createSkirmish(String feudId, Skirmish skirmish) {
    final feud = feuds[feudId];
    if (feud != null) {
      final allSkirmishes = [...feud.skirmishes, skirmish];
      allSkirmishes
          .sort((a, b) => b.date.compareTo(a.date)); // descending by date

      final updatedFeud = Feud(
        id: feud.id,
        name: feud.name,
        foes: feud.foes,
        skirmishes: allSkirmishes,
      );
      feudService.updateFeud(feud.id, updatedFeud);
    }
  }
}
