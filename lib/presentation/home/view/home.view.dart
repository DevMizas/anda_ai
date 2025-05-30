import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeView extends StatefulWidget {
  final BleViewModel bleViewModel;

  const HomeView({
    super.key,
    required this.bleViewModel,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Stream<StepCount>? _stepCountStream = Pedometer.stepCountStream;
  String _steps = '0';
  String _status = 'Verificando sensor...';

  @override
  void initState() {
    super.initState();
    _initPedometer();
  }

  Future<void> _initPedometer() async {
    final status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      setState(() {
        _status = 'Permissão não concedida para ler passos';
      });
      return;
    }

    try {
      _stepCountStream!.listen(_onStepCount).onError(_onStepCountError);
      setState(() {
        _status = 'Sensor funcionando';
      });
    } catch (e) {
      setState(() {
        _status = 'Erro ao iniciar pedômetro';
      });
    }
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void _onStepCountError(error) {
    setState(() {
      _status = 'Sensor de passos não disponível neste dispositivo';
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.bleViewModel;

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
              'Passos (sensor): $_steps',
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
              _status,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
