import 'package:friendly_feud/models/data.dart';
import 'package:friendly_feud/services/feud_service.dart';
import 'package:get/get.dart';

import '../models/feud.dart';

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

  void updateFeud(Feud feud) {
    feuds[feud.id] = feud;
    feudService.updateFeud(feud.id, feud);
  }
}
