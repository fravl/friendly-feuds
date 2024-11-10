import 'package:flutter/material.dart';
import 'package:friendly_feud/app_theme.dart';
import 'package:friendly_feud/hive_registrar.g.dart';
import 'package:friendly_feud/services/feud_controller.dart';
import 'package:friendly_feud/services/feud_service.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'screens/feud_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Hive.registerAdapters();

  Get.lazyPut<FeudService>(() => FeudService());
  Get.lazyPut<FeudController>(() => FeudController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Friendly Feuds',
      theme: appTheme(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => throw FeudScreen()),
        GetPage(name: "/feuds/:feud", page: () => throw UnimplementedError()),
        GetPage(
            name: "/feuds/:feud/stats", page: () => throw UnimplementedError()),
        GetPage(name: "/welcome", page: () => throw UnimplementedError()),
      ],
    );
  }
}
