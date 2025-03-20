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
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFD32F2F), // Vermelho primário
          secondary: Color(0xFFB71C1C), // Vermelho escuro
          surface: Color(0xFF212121),
          background: Color(0xFF212121),
          onPrimary: Color(0xFFF5F5F5),
          onBackground: Color(0xFFF5F5F5),
        ),
        scaffoldBackgroundColor: Color(0xFF212121),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFF5F5F5)),
          bodyLarge: TextStyle(color: Color(0xFFF5F5F5)),
          titleLarge: TextStyle(
            color: Color(0xFFF5F5F5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFD32F2F),
            foregroundColor: Color(0xFFF5F5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF424242),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          labelStyle: TextStyle(color: Color(0xFFF5F5F5)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFD32F2F),
          foregroundColor: Color(0xFFF5F5F5),
        ),
      ),
      home: ConverterScreen(),
    );
  }
}
