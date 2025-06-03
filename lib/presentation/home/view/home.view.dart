import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomeView extends StatelessWidget {
  final sensorCheckViewModel = SensorCheckViewModel();
  final BleViewModel bleViewModel;

  HomeView({
    super.key,
    required this.bleViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final vm = bleViewModel;

    return Scaffold(
      appBar: AppBar(title: const Text("Anda aí")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Observer(
              builder: (_) => Text(
                'Passos (BLE): ${vm.bleSteps}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Text(
              'Passos (sensor): ${sensorCheckViewModel.steps}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => Text(
                'Status Bluetooth: ${vm.connectionState}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: vm.connectionState.contains("Conectado") ? Colors.green : Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                vm.startScan();
              },
              child: const Text("Buscar dispositivos BLE"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: vm.devices.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final device = vm.devices[index];
                    return ListTile(
                      title: Text(device.platformName),
                      subtitle: Text(device.remoteId.str),
                      trailing: const Icon(Icons.bluetooth),
                      onTap: () async {
                        await vm.connectToDevice(device);
                        await vm.subscribeToSteps(
                          device,
                          Guid('6e400001-b5a3-f393-e0a9-e50e24dcca9e'),
                          Guid('6e400003-b5a3-f393-e0a9-e50e24dcca9e'),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              sensorCheckViewModel.sensorStatus,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
