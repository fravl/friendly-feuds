import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback? floatingButtonFunc;

  const CustomScaffold(
      {super.key,
      required this.child,
      required this.title,
      this.floatingButtonFunc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 960,
          child: child,
        ),
      ),
      floatingActionButton: floatingButtonFunc != null
          ? FloatingActionButton.large(
              onPressed: floatingButtonFunc,
              child: const Icon(Icons.add), // Customize the icon as needed
            )
          : null,
    );
  }
}
