import 'package:adaptive_scaffold_demo/pages/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const AdaptiveScaffoldDemoApp());
}

class AdaptiveScaffoldDemoApp extends StatelessWidget {
  const AdaptiveScaffoldDemoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Scaffold Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
