import 'package:flutter/material.dart';
import 'package:flutter_rte_tester/main_screen.dart';

void main() {
  runApp(const RTEApp());
}

class RTEApp extends StatelessWidget {
  const RTEApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rich Text Editor Tester',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
