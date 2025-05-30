import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobx/mobx.dart';

part 'ble.viewmodel.g.dart';

class BleViewModel = _BleViewModelBase with _$BleViewModel;

abstract class _BleViewModelBase with Store {
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
    _scanSubscription = FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        final device = result.device;
        if (device.platformName.isNotEmpty) {
          addDevice(device);
        }
      }
    });

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
  }

  @action
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(timeout: const Duration(seconds: 10));
      setConnectionState("Conectado a ${device.advName}");
    } catch (e) {
      setConnectionState("Erro ao conectar");
    }
  }

  @action
  Future<void> subscribeToSteps(BluetoothDevice device, Guid serviceUuid, Guid charUuid) async {
    final services = await device.discoverServices();
    for (var service in services) {
      if (service.uuid == serviceUuid) {
        for (var char in service.characteristics) {
          if (char.uuid == charUuid) {
            await char.setNotifyValue(true);
            char.lastValueStream.listen((value) {
              if (value.length >= 2) {
                final byteData = ByteData.sublistView(Uint8List.fromList(value));
                final stepCount = byteData.getUint16(0, Endian.little); // ou Endian.big dependendo do dispositivo
                updateSteps(stepCount);
              }
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
