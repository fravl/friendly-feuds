import 'package:flutter/material.dart';
import 'package:friendly_feud/models/skirmish.dart';
import 'package:friendly_feud/widgets/custom_scaffold.dart';
import 'package:friendly_feud/widgets/skirmish_form.dart';
import 'package:get/get.dart';

import '../services/feud_controller.dart';

class SkirmishCreatorScreen extends StatelessWidget {
  final feudController = Get.find<FeudController>();

  SkirmishCreatorScreen({super.key});

  void createSkirmish(String feudId, Skirmish skirmish) {
    feudController.createSkirmish(feudId, skirmish);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Add a skirmish",
        child: Obx(() {
          var feudId = Get.parameters['feud'];
          var feud = feudController.feuds[feudId];

          return SkirmishForm(
              foes: feud!.foes,
              onSubmit: (skirmish) {
                createSkirmish(feudId!, skirmish);
              });
        }));
  }
}
