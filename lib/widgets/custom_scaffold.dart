import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friendly Feuds"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 960,
          child: child,
        ),
      ),
    );
  }
}
