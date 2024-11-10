import 'package:flutter/material.dart';

class FlexibleGrid extends StatelessWidget {
  final List<Widget> gridItems;

  const FlexibleGrid({super.key, required this.gridItems});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    var count = 4;
    if (width < 480) {
      count = 1;
    } else if (width < 640) {
      count = 2;
    } else if (width < 768) {
      count = 3;
    }

    return GridView.count(
      padding: const EdgeInsets.all(8),
      crossAxisCount: count,
      children: gridItems,
    );
  }
}
