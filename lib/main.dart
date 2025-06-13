import 'package:anda_ai/core/core.dart';
import 'package:flutter/material.dart';

import 'presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final searchingBluetoothVM = SearchingBluetoothViewModel();
    final bleViewModel = BleViewModel();
    final sensorViewModel = SensorCheckViewModel();
  

    return MaterialApp(
      title: 'Anda aí',
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home: (_) => SensorCheckView(),
        AppRoutes.steps: (_) => StepsView(bleViewModel: bleViewModel, sensorViewModel: sensorViewModel),
        AppRoutes.searchingBluetooth: (_) => SearchingBluetoothView(
          bleViewModel: bleViewModel,
          searchingBluetoothVM: searchingBluetoothVM,
        ),
      },
    );
  }
}
