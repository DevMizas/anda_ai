import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';

class SearchingBluetoothView extends StatelessWidget {
  final BleViewModel bleViewModel;
  const SearchingBluetoothView({super.key, required this.bleViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 182, 255),
      body: Center(child: BottonSearchBluetooth(bleViewModel: bleViewModel)),
    );
  }
}
