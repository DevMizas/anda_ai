import 'dart:typed_data';

class StepBluetoothService {
  int? extractStepsFromRawData(List<int> raw) {
    if (raw.isEmpty || raw[0] != 0xAB || raw.length < 16) {
      print('Pacote inválido ou muito curto');
      return null;
    }
    try {
      final byteData = ByteData.sublistView(Uint8List.fromList(raw));
      return byteData.getUint16(15, Endian.little);
    } catch (e) {
      print('Erro ao extrair passos: $e');
      return null;
    }
  }
}
