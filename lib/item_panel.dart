import 'package:flutter/material.dart';

class ItemPanel extends StatelessWidget {
  const ItemPanel(
      {super.key,
      required this.crossAxisCount,
      required this.items,
      required this.spacing});

  final int crossAxisCount;
  final List<String> items;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      children: items.asMap().entries.map((MapEntry<int, String> entry) {
        Widget child = Center(
          child: Text(
            entry.value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
        );

        child = Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: child);

        return child;
      }).toList(),
    );
  }
}
