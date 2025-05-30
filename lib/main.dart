import 'package:flutter/material.dart';

import 'presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bleViewModel = BleViewModel();

    return MaterialApp(
      title: 'Anda aí',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeView(bleViewModel: bleViewModel),
    );
  }
}
