import 'dart:typed_data';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleRepository {
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;
  late final Function(int)? onStepsReceived;

  Future<void> startScan({Duration timeout = const Duration(seconds: 5)}) async {
    await FlutterBluePlus.startScan(timeout: timeout);
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect(timeout: const Duration(seconds: 10));
  }

  Future<List<BluetoothService>> discoverServices(BluetoothDevice device) async {
    return await device.discoverServices();
  }

  Future<void> setNotify(
  BluetoothCharacteristic characteristic,
  void Function(List<int> value) onRawData,
) async {
  await characteristic.setNotifyValue(true);
  characteristic.lastValueStream.listen((value) {
    onRawData(value);

    final data = Uint8List.fromList(value);
    if (isStepPacket(data)) {
      final steps = parseStepCount(data);
      onStepsReceived?.call(steps);
    }
  });
}


  bool isValidPacket(Uint8List data) {
    return data.isNotEmpty && data[0] == 0xAB && data.length > 10;
  }

  int parseStepCount(Uint8List value) {

    if (!isValidPacket(value)) {
      return 0;
    }

    final steps = value[10];
    return steps;
  }

  bool isStepPacket(Uint8List data) {
  return data.length >= 20 && data[0] == 0xAB && data[10] > 0;
}

  void handleReceivedData(Uint8List data) {
  print('Pacote recebido: ${data.toList()}');

  if (isStepPacket(data)) {
    int stepCount = data[10];
    print('Passos detectados: $stepCount');
    onStepsReceived?.call(stepCount);
  }
}
}
