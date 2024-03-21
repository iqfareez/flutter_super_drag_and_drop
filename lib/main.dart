import 'package:flutter/material.dart';
import 'package:flutter_super_drag_and_drop/split_panels.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SplitPanels(),
      ),
    );
  }
}
