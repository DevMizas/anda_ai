// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BleViewModel on _BleViewModelBase, Store {
  late final _$devicesAtom =
      Atom(name: '_BleViewModelBase.devices', context: context);

  @override
  ObservableList<BluetoothDevice> get devices {
    _$devicesAtom.reportRead();
    return super.devices;
  }

  @override
  set devices(ObservableList<BluetoothDevice> value) {
    _$devicesAtom.reportWrite(value, super.devices, () {
      super.devices = value;
    });
  }

  late final _$connectionStateAtom =
      Atom(name: '_BleViewModelBase.connectionState', context: context);

  @override
  String get connectionState {
    _$connectionStateAtom.reportRead();
    return super.connectionState;
  }

  @override
  set connectionState(String value) {
    _$connectionStateAtom.reportWrite(value, super.connectionState, () {
      super.connectionState = value;
    });
  }

  late final _$bleStepsAtom =
      Atom(name: '_BleViewModelBase.bleSteps', context: context);

  @override
  int get bleSteps {
    _$bleStepsAtom.reportRead();
    return super.bleSteps;
  }

  @override
  set bleSteps(int value) {
    _$bleStepsAtom.reportWrite(value, super.bleSteps, () {
      super.bleSteps = value;
    });
  }

  late final _$startScanAsyncAction =
      AsyncAction('_BleViewModelBase.startScan', context: context);

  @override
  Future<void> startScan() {
    return _$startScanAsyncAction.run(() => super.startScan());
  }

  late final _$connectToDeviceAsyncAction =
      AsyncAction('_BleViewModelBase.connectToDevice', context: context);

  @override
  Future<void> connectToDevice(BluetoothDevice device) {
    return _$connectToDeviceAsyncAction
        .run(() => super.connectToDevice(device));
  }

  late final _$subscribeToStepsAsyncAction =
      AsyncAction('_BleViewModelBase.subscribeToSteps', context: context);

  @override
  Future<void> subscribeToSteps(
      BluetoothDevice device, Guid serviceUuid, Guid charUuid) {
    return _$subscribeToStepsAsyncAction
        .run(() => super.subscribeToSteps(device, serviceUuid, charUuid));
  }

  late final _$discoverServicesAsyncAction =
      AsyncAction('_BleViewModelBase.discoverServices', context: context);

  @override
  Future<void> discoverServices(BluetoothDevice device) {
    return _$discoverServicesAsyncAction
        .run(() => super.discoverServices(device));
  }

  late final _$disposeAsyncAction =
      AsyncAction('_BleViewModelBase.dispose', context: context);

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_BleViewModelBaseActionController =
      ActionController(name: '_BleViewModelBase', context: context);

  @override
  void addDevice(BluetoothDevice device) {
    final _$actionInfo = _$_BleViewModelBaseActionController.startAction(
        name: '_BleViewModelBase.addDevice');
    try {
      return super.addDevice(device);
    } finally {
      _$_BleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConnectionState(String state) {
    final _$actionInfo = _$_BleViewModelBaseActionController.startAction(
        name: '_BleViewModelBase.setConnectionState');
    try {
      return super.setConnectionState(state);
    } finally {
      _$_BleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSteps(int value) {
    final _$actionInfo = _$_BleViewModelBaseActionController.startAction(
        name: '_BleViewModelBase.updateSteps');
    try {
      return super.updateSteps(value);
    } finally {
      _$_BleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
devices: ${devices},
connectionState: ${connectionState},
bleSteps: ${bleSteps}
    ''';
  }
}
