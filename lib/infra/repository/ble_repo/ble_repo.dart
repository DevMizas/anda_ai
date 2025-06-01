import 'dart:async';
import 'dart:typed_data';
import 'package:anda_ai/infra/infra.dart';
import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleRepository {
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;
  late final Function(int)? onStepsReceived;
  final stepViewModel = StepViewModel(StepBluetoothService());

  Future<void> startScan({Duration timeout = const Duration(seconds: 5)}) async {
    await FlutterBluePlus.startScan(timeout: timeout);
  }

  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect(timeout: const Duration(seconds: 10));
  }

  Future<List<BluetoothService>> discoverServices(BluetoothDevice device) async {
    return await device.discoverServices();
  }

  Future<void> setNotify(
    BluetoothCharacteristic characteristic,
    void Function(List<int> value) onData,
  ) async {
    await characteristic.setNotifyValue(true);
    characteristic.lastValueStream.listen((value) {
  onData(value);
  handleReceivedData(Uint8List.fromList(value));
  print('RAW VALUE: $value');
  stepViewModel.onRawPacketReceived(value);
});
  }

  bool isValidPacket(Uint8List data) {
  return data.isNotEmpty && data[0] == 0xAB && data.length >= 16;
}

  int extractSteps(Uint8List data) {
  if (!isValidPacket(data)) return 0;

  int offset = 15;
  if (data.length > offset + 1) {
    return data[offset] | (data[offset + 1] << 8);
  }

  return 0;
}

  int parseStepCount(Uint8List value) {
  print('Pacote bruto recebido: $value');
  print('Tentando detectar valor de passos...');

  if (value.length < 16) {
    print('⚠️ Pacote muito curto: ${value.length} bytes');
    return 0;
  }

  final byteData = ByteData.sublistView(value);

  for (int offset = 0; offset <= value.length - 2; offset++) {
    try {
      final littleEndian = byteData.getUint16(offset, Endian.little);
      final bigEndian = byteData.getUint16(offset, Endian.big);

      print('→ Offset $offset: little=$littleEndian | big=$bigEndian');

      if (offset == 15) {
        print('→ Passos extraídos: $littleEndian');
        return littleEndian;
      }

    } catch (e) {
      print('Erro ao ler offset $offset: $e');
    }
  }

  print('❌ Nenhum valor de passos detectado.');
  return 0;
}

void handleReceivedData(Uint8List data) {
    print("RAW VALUE: $data");

    if (data.isEmpty || data[0] != 0xAB) {
      print("⚠️ Pacote inválido ou sem cabeçalho esperado (0xAB)");
      return;
    }

    if (data.length < 16) {
      print("⚠️ Pacote muito curto: ${data.length} bytes");
      onStepsReceived?.call(0);
      return;
    }

    try {
      final byteData = ByteData.sublistView(data);
      final steps = byteData.getUint16(14, Endian.little);
      print("→ Passos extraídos: $steps");

      // Notifica o listener (ViewModel/BLoC)
      onStepsReceived?.call(steps);
    } catch (e) {
      print("⚠️ Erro ao extrair passos: $e");
    }
  }

}
