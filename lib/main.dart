import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:friendly_feud/app_theme.dart';
import 'package:friendly_feud/hive_registrar.g.dart';
import 'package:friendly_feud/services/feud_controller.dart';
import 'package:friendly_feud/services/feud_service.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'screens/feud_screen.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  await Hive.openBox("storage");

  Get.lazyPut<FeudService>(() => FeudService());
  Get.lazyPut<FeudController>(() => FeudController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Comic Neue", "Nosifer");

    MaterialTheme theme = MaterialTheme(textTheme);

    return GetMaterialApp(
      title: 'Friendly Feuds',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => FeudScreen()),
        GetPage(name: "/feuds/:feud", page: () => throw UnimplementedError()),
        GetPage(
            name: "/feuds/:feud/stats", page: () => throw UnimplementedError()),
        GetPage(name: "/welcome", page: () => throw UnimplementedError()),
      ],
    );
  }
}
