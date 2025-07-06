import 'package:flutter/material.dart';
import 'package:friendly_feud/services/feud_controller.dart';
import 'package:friendly_feud/widgets/custom_scaffold.dart';
import 'package:friendly_feud/widgets/flexible_grid.dart';
import 'package:friendly_feud/widgets/skirmish_card.dart';
import 'package:get/get.dart';

class SkirmishesScreen extends StatelessWidget {
  final feudController = Get.find<FeudController>();

  SkirmishesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var feudId = Get.parameters['feud'];
    final feud = feudController.feuds[feudId];

    return CustomScaffold(
      title: feud?.name ?? '',
      floatingButtonFunc: () => Get.toNamed("/feuds/${feud?.id}/skirmish"),
      child: Obx(() {
        final feud = feudController.feuds[feudId];
        final skirmishes = feud?.skirmishes ?? [];

        if (skirmishes.isEmpty) {
          return const Center(child: Text('No skirmishes available.'));
        }

        return FlexibleGrid(
          gridItems: skirmishes
              .map((skirmish) => SkirmishCard(skirmish: skirmish))
              .toList(),
        );
      }),
    );
  }
}
