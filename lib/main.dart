import 'package:flutter/material.dart';
import 'package:ppam_tugas2/pages/page_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tugas 2 PPAM",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.yellow,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.yellow,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      home: const PageLogin(),
    );
  }
}
