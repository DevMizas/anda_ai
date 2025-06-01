import 'dart:async';
import 'package:anda_ai/infra/infra.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobx/mobx.dart';
part 'ble.viewmodel.g.dart';

class BleViewModel = _BleViewModelBase with _$BleViewModel;

abstract class _BleViewModelBase with Store {
  late final BleRepository _repository;

  _BleViewModelBase(this._repository);

  @observable
  ObservableList<BluetoothDevice> devices = ObservableList();

  @observable
  String connectionState = "Desconectado";

  @observable
  int bleSteps = 0;

  StreamSubscription? _scanSubscription;

  @action
  void addDevice(BluetoothDevice device) {
    if (!devices.any((d) => d.remoteId == device.remoteId)) {
      devices.add(device);
    }
  }

  @action
  void setConnectionState(String state) {
    connectionState = state;
  }

  @action
  void updateSteps(int value) {
    bleSteps = value;
  }

  @action
  Future<void> startScan() async {
    devices.clear();
    await _scanSubscription?.cancel();

    _scanSubscription = _repository.scanResults.listen((results) {
      for (var result in results) {
        final device = result.device;
        if (device.platformName.isNotEmpty) {
          addDevice(device);
        }
      }
    });

    await _repository.startScan();
  }

  @action
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await _repository.connectToDevice(device);
      setConnectionState("Conectado a ${device.advName}");
    } catch (_) {
      setConnectionState("Erro ao conectar");
    }
  }

  @action
  Future<void> subscribeToSteps(BluetoothDevice device, Guid serviceUuid, Guid charUuid) async {
    final services = await _repository.discoverServices(device);
    for (var service in services) {
      if (service.uuid == serviceUuid) {
        for (var char in service.characteristics) {
          if (char.uuid == charUuid) {
            _repository.onStepsReceived = (int steps) {
              print("Passos detectados: $steps");
            };
            await _repository.setNotify(char, (value) {
              print('RAW VALUE: $value');
              final stepCount = _repository.parseStepCount(Uint8List.fromList(value));
              print('→ Passos extraídos: $stepCount');
              updateSteps(stepCount);
            });
          }
        }
      }
    }
  }

  @action
  Future<void> dispose() async {
    await _scanSubscription?.cancel();
  }
}
