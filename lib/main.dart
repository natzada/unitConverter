import 'package:flutter/material.dart';
import '../screens/converter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        // Substitui primarySwatch por colorScheme para Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Define a densidade visual
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Atualiza TextTheme para usar bodyMedium
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: ConverterScreen(),
    );
  }
}
