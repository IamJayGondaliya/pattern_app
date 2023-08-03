import 'package:flutter/material.dart';
import 'package:pattern_app/provider/num_provioder.dart';
import 'package:pattern_app/views/screens/pattern_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NumProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PatternScreen(),
    );
  }
}
