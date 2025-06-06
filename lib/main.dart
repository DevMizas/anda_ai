import 'package:anda_ai/core/core.dart';
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
    final searchingBluetoothVM = SearchongBluetoothViewModel();

    return MaterialApp(
      title: 'Anda aí',
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home: (_) => SensorCheckView(),
        AppRoutes.steps: (_) => Stepsiew(bleViewModel: bleViewModel),
        AppRoutes.searchingBluetooth: (_) => SearchingBluetoothView(
          bleViewModel: bleViewModel,
          searchingBluetoothVM: searchingBluetoothVM,
        ),
      },
    );
  }
}
