import 'package:ai_image_generator/ai_generator_screen.dart';
import 'package:ai_image_generator/generator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GeneratorProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Image Generator Mobile App',
      debugShowCheckedModeBanner: false,
      home: const AiGeneratorScreen(),
    );
  }
}
