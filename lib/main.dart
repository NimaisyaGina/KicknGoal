import 'package:flutter/material.dart';
// Import file menu.dart yang sudah dipindahkan ke folder screens
import 'package:kickngoal/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kick n Goal',
      theme: ThemeData(
        // Tema warna diubah sesuai Tutorial 6 [cite: 1415]
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
        useMaterial3: true,
      ),
      // Home diubah sesuai Tutorial 6 [cite: 1425, 1426]
      home: MyHomePage(),
    );
  }
}