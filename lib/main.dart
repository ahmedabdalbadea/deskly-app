import 'package:flutter/material.dart';

void main() {
  runApp(const DesklyApp());
}

class DesklyApp extends StatelessWidget {
  const DesklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
    );
  }
}
