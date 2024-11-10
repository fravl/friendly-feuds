import 'package:flutter/material.dart';
import 'package:friendly_feud/widgets/custom_scaffold.dart';
import 'package:friendly_feud/widgets/feud_form.dart';
import 'package:get/get.dart';

import '../models/feud.dart';
import '../services/feud_controller.dart';

class FeudStarterScreen extends StatelessWidget {
  final feudController = Get.find<FeudController>();

  FeudStarterScreen({super.key});

  void startFeud(Feud feud) {
    feudController.addFeud(feud);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Start a Feud",
        child: FeudForm(
          onSubmit: startFeud,
        ));
  }
}
