import 'package:anda_ai/infra/infra.dart';
import 'package:flutter/material.dart';

import 'presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = BleRepository();
    final bleViewModel = BleViewModel(repository);

    return MaterialApp(
      title: 'Anda aí',
      debugShowCheckedModeBanner: false,
      home: SensorCheckView(),//HomeView(bleViewModel: bleViewModel),
    );
  }
}
