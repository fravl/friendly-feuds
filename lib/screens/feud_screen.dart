import 'package:flutter/material.dart';
import 'package:friendly_feud/screens/feud_starter_screen.dart';
import 'package:friendly_feud/services/feud_controller.dart';
import 'package:friendly_feud/widgets/custom_scaffold.dart';
import 'package:friendly_feud/widgets/flexible_grid.dart';
import 'package:get/get.dart';

import '../widgets/feud_card.dart';

class FeudScreen extends StatelessWidget {
  final feudController = Get.find<FeudController>();

  FeudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Friendly Feuds",
      floatingButtonFunc: () => Get.to(() => FeudStarterScreen()),
      child: Obx(() {
        final feuds = feudController.feuds;

        if (feuds.isEmpty) {
          return const Center(child: Text('No feuds available.'));
        }

        return FlexibleGrid(
            gridItems:
                feuds.values.map((feud) => FeudCard(feud: feud)).toList());
      }),
    );
  }
}
