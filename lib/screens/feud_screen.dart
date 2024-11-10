import 'package:flutter/material.dart';
import 'package:friendly_feud/services/feud_controller.dart';
import 'package:friendly_feud/widgets/feud_list.dart';
import 'package:get/get.dart';

class FeudScreen extends StatelessWidget {
  final feudController = Get.find<FeudController>();

  FeudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feuds'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Handle adding a new feud here
              // Example: feudController.addFeud(newFeud);
            },
          ),
        ],
      ),
      body: Obx(() {
        final feuds = feudController.feuds;

        if (feuds.isEmpty) {
          return const Center(child: Text('No feuds available.'));
        }

        return FeudList(feuds: feuds.values.toList());
      }),
    );
  }
}
