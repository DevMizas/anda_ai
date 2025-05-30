import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleService {
  final _ble = FlutterReactiveBle();

  Stream<DiscoveredDevice> scanDevices() {
    return _ble.scanForDevices(withServices: []);
  }

  Stream<ConnectionStateUpdate> connect(String deviceId) {
    return _ble.connectToDevice(id: deviceId);
  }

  Future<List<Service>> discoveredServices(String deviceId) {
    return _ble.getDiscoveredServices(deviceId);
  }

  Stream<List<int>> subscribeToSteps({
    required String deviceId,
    required Uuid serviceId,
    required Uuid characteristicId,
  }) {
    final characteristic = QualifiedCharacteristic(characteristicId: characteristicId, serviceId: serviceId, deviceId: deviceId,);
    return _ble.subscribeToCharacteristic(characteristic);
  }
}
