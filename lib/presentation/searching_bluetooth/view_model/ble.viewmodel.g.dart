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

  late final _$stepCountAtom =
      Atom(name: '_BleViewModelBase.stepCount', context: context);

  @override
  int get stepCount {
    _$stepCountAtom.reportRead();
    return super.stepCount;
  }

  @override
  set stepCount(int value) {
    _$stepCountAtom.reportWrite(value, super.stepCount, () {
      super.stepCount = value;
    });
  }

  late final _$isConnectedAtom =
      Atom(name: '_BleViewModelBase.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$localStepCountAtom =
      Atom(name: '_BleViewModelBase.localStepCount', context: context);

  @override
  int get localStepCount {
    _$localStepCountAtom.reportRead();
    return super.localStepCount;
  }

  @override
  set localStepCount(int value) {
    _$localStepCountAtom.reportWrite(value, super.localStepCount, () {
      super.localStepCount = value;
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

  late final _$initialBleStepsAtom =
      Atom(name: '_BleViewModelBase.initialBleSteps', context: context);

  @override
  int get initialBleSteps {
    _$initialBleStepsAtom.reportRead();
    return super.initialBleSteps;
  }

  @override
  set initialBleSteps(int value) {
    _$initialBleStepsAtom.reportWrite(value, super.initialBleSteps, () {
      super.initialBleSteps = value;
    });
  }

  late final _$initialLocalStepCountAtom =
      Atom(name: '_BleViewModelBase.initialLocalStepCount', context: context);

  @override
  int get initialLocalStepCount {
    _$initialLocalStepCountAtom.reportRead();
    return super.initialLocalStepCount;
  }

  @override
  set initialLocalStepCount(int value) {
    _$initialLocalStepCountAtom.reportWrite(value, super.initialLocalStepCount,
        () {
      super.initialLocalStepCount = value;
    });
  }

  late final _$connectAsyncAction =
      AsyncAction('_BleViewModelBase.connect', context: context);

  @override
  Future<void> connect(BluetoothDevice device) {
    return _$connectAsyncAction.run(() => super.connect(device));
  }

  late final _$disconnectAsyncAction =
      AsyncAction('_BleViewModelBase.disconnect', context: context);

  @override
  Future<void> disconnect() {
    return _$disconnectAsyncAction.run(() => super.disconnect());
  }

  late final _$_BleViewModelBaseActionController =
      ActionController(name: '_BleViewModelBase', context: context);

  @override
  void startLocalStepCounter() {
    final _$actionInfo = _$_BleViewModelBaseActionController.startAction(
        name: '_BleViewModelBase.startLocalStepCounter');
    try {
      return super.startLocalStepCounter();
    } finally {
      _$_BleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLocalStepCounter() {
    final _$actionInfo = _$_BleViewModelBaseActionController.startAction(
        name: '_BleViewModelBase.stopLocalStepCounter');
    try {
      return super.stopLocalStepCounter();
    } finally {
      _$_BleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void clearDevices() {
    final _$actionInfo = _$_BleViewModelBaseActionController.startAction(
        name: '_BleViewModelBase.clearDevices');
    try {
      return super.clearDevices();
    } finally {
      _$_BleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startScan() {
    final _$actionInfo = _$_BleViewModelBaseActionController.startAction(
        name: '_BleViewModelBase.startScan');
    try {
      return super.startScan();
    } finally {
      _$_BleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
devices: ${devices},
stepCount: ${stepCount},
isConnected: ${isConnected},
localStepCount: ${localStepCount},
bleSteps: ${bleSteps},
initialBleSteps: ${initialBleSteps},
initialLocalStepCount: ${initialLocalStepCount}
    ''';
  }
}
