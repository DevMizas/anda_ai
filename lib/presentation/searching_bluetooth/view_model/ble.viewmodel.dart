import 'dart:async';
import 'dart:typed_data';
import 'package:mobx/mobx.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:pedometer/pedometer.dart';

part 'ble.viewmodel.g.dart';

class BleViewModel = _BleViewModelBase with _$BleViewModel;

abstract class _BleViewModelBase with Store {
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? stepCharacteristic;
  StreamSubscription<StepCount>? _stepCountSubscription;

  @observable
  ObservableList<BluetoothDevice> devices = ObservableList<BluetoothDevice>();

  @observable
  int stepCount = 0;

  @observable
  bool isConnected = false;

  @observable
  int localStepCount = 0;

  @observable
  int bleSteps = 0;

  @observable
  int initialBleSteps = -1;

  @observable
  int initialLocalStepCount = -1;

  @action
  void startLocalStepCounter() {
    _stepCountSubscription = Pedometer.stepCountStream.listen(
      (StepCount event) {
        if (initialLocalStepCount == -1) {
          initialLocalStepCount = event.steps;
        }
        localStepCount = event.steps - initialLocalStepCount;
      },
      onError: (error) {
        print('Erro ao ler passos locais: $error');
      },
      cancelOnError: true,
    );
  }

  @action
  void stopLocalStepCounter() {
    _stepCountSubscription?.cancel();
    _stepCountSubscription = null;
  }

  @action
  void addDevice(BluetoothDevice device) {
    if (device.platformName.trim().isEmpty) return;

    final exists = devices.any((d) => d.remoteId == device.remoteId);
    if (!exists) {
      devices.add(device);
    }
  }

  @action
  void clearDevices() {
    devices.clear();
  }

  @action
  Future<void> connect(BluetoothDevice device) async {
    connectedDevice = device;

    try {
      await device.connect(autoConnect: false);
    } catch (e) {
      if (!e.toString().toLowerCase().contains('already connected')) {
        print("Erro ao conectar no dispositivo: $e");
        return;
      }
    }

    final services = await connectedDevice?.discoverServices();
    if (services == null) return;

    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.uuid.toString().toLowerCase() ==
            '6e400003-b5a3-f393-e0a9-e50e24dcca9e') {
          stepCharacteristic = characteristic;
          await _autoSubscribeToSteps(characteristic);
          break;
        }
      }
    }

    isConnected = true;
  }

  @action
Future<void> disconnect() async {
  await connectedDevice?.disconnect();
  connectedDevice = null;
  stepCharacteristic = null;
  stepCount = 0;
  initialBleSteps = -1; // reset
  bleSteps = 0;
  isConnected = false;
}

  Future<void> _autoSubscribeToSteps(
    BluetoothCharacteristic characteristic,
  ) async {
    await characteristic.setNotifyValue(true);
    characteristic.lastValueStream.listen((value) {
      final data = Uint8List.fromList(value);
      if (_isStepPacket(data)) {
        final steps = _parseStepCount(data);

        if (initialBleSteps == -1) {
          initialBleSteps = steps;
        }

        bleSteps = steps - initialBleSteps;
      }
    });
  }

  bool _isValidPacket(Uint8List data) {
    return data.isNotEmpty && data[0] == 0xAB && data.length > 10;
  }

  bool _isStepPacket(Uint8List data) {
    return data.length >= 20 && data[0] == 0xAB && data[10] > 0;
  }

  int _parseStepCount(Uint8List data) {
    if (!_isValidPacket(data)) return 0;
    return data[10];
  }

  @action
  void startScan() {
    clearDevices();
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        addDevice(result.device);
      }
    });
  }
}
