import 'dart:async';
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

    await device.connect(autoConnect: false);
    await device.requestMtu(256);
    await device.discoverServices();

    final services = await device.discoverServices();

    BluetoothCharacteristic? notifyCharacteristic;

    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.properties.notify) {
          notifyCharacteristic = characteristic;
          print('🔍 Found Notify Characteristic: ${characteristic.uuid}');
          break;
        }
      }
      if (notifyCharacteristic != null) break;
    }

    if (notifyCharacteristic != null) {
      await _subscribeToCharacteristic(notifyCharacteristic);
    } else {
      print('❌ Nenhuma characteristic com notify encontrada.');
    }
  }

  Future<void> _subscribeToCharacteristic(
    BluetoothCharacteristic characteristic,
  ) async {
    await characteristic.setNotifyValue(true);

    late final StreamSubscription<List<int>> subscription;

    subscription = characteristic.value.listen((data) {
      if (data.isNotEmpty) {
        updateStepsFromPacket(data);

        // ⛔️ Cancela após o primeiro pacote recebido
        //subscription.cancel();
      }
    });
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

  @action
  void updateStepsFromPacket(List<int> packet) {
    print('🟢 BLE Raw Packet Received: $packet');

    if (packet.isEmpty) {
      print('⚠️ Pacote BLE inválido ou vazio');
      return;
    }

    // Validação mínima — ajuste se necessário para seu relógio
    if (packet.length < 17) {
      print('⚠️ Pacote BLE inválido ou incompleto');
      return;
    }

    // Verifica header, se necessário (opcional)
    final header = packet[0];
    if (header != 0xAB) {
      print('⚠️ Header desconhecido: $header');
      return;
    }

    try {
      // 🏃‍♂️ Extrai os bytes dos passos (posição pode variar conforme o dispositivo)
      final stepsLow = packet[15]; // Byte menos significativo
      final stepsHigh = packet[16]; // Byte mais significativo

      final combinedSteps = stepsLow + (stepsHigh << 8); // Little endian

      print('👣 Passos combinados (BLE): $combinedSteps');
      bleSteps = combinedSteps;
    } catch (e) {
      print('❌ Erro ao processar pacote BLE: $e');
    }
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
