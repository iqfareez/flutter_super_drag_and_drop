import 'package:flutter/material.dart';
import 'package:flutter_super_drag_and_drop/types.dart';

import 'item_panel.dart';

class SplitPanels extends StatefulWidget {
  const SplitPanels({super.key, this.columns = 5, this.itemSpacing = 4.0});

  final int columns;
  final double itemSpacing;

  @override
  State<SplitPanels> createState() => _SplitPanelsState();
}

class _SplitPanelsState extends State<SplitPanels> {
  final List<String> upper = [];
  final List<String> lower = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];

  PanelLocation? dragStart;
  PanelLocation? dragEnd;
  String? hoveringData;

  void onDragStart(PanelLocation start) {
    final data = switch (start.$2) {
      Panel.lower => lower[start.$1],
      Panel.upper => upper[start.$1],
    };

    setState(() {
      dragStart = start;
      hoveringData = data;
    });
  }

  // https://youtu.be/c6BPtrU0M7I?t=294

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final gutters = widget.columns + 1;
        final spaceForColumns =
            constraints.maxWidth - (gutters * widget.itemSpacing);
        final columnWidth = spaceForColumns / widget.columns;
        final itemSize = Size(columnWidth, columnWidth);

        print(itemSize);

        return Stack(children: [
          Positioned(
              height: constraints.maxHeight / 2,
              width: constraints.maxWidth,
              top: 0,
              child: ItemPanel(
                crossAxisCount: widget.columns,
                spacing: widget.itemSpacing,
                items: upper,
              )),
          Positioned(
              height: 2,
              width: constraints.maxWidth,
              top: constraints.maxHeight / 2,
              child: ColoredBox(
                color: Colors.black,
              )),
          Positioned(
              height: constraints.maxHeight / 2,
              width: constraints.maxWidth,
              bottom: 0,
              child: ItemPanel(
                crossAxisCount: widget.columns,
                spacing: widget.itemSpacing,
                items: lower,
              )),
        ]);
      },
    );
  }
}
