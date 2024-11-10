import 'package:friendly_feud/services/feud_service.dart';
import 'package:get/get.dart';

import '../models/feud.dart';

class FeudController {
  final feudService = Get.find<FeudService>();

  RxMap feuds;

  FeudController() : feuds = {}.obs {
    feuds.value = feudService.feuds;
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
