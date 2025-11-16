import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const OlxApp());
}

class OlxApp extends StatelessWidget {
  const OlxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
