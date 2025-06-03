// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_check.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SensorCheckViewModel on _SensorCheckViewModelBase, Store {
  late final _$stepsAtom =
      Atom(name: '_SensorCheckViewModelBase.steps', context: context);

  @override
  String get steps {
    _$stepsAtom.reportRead();
    return super.steps;
  }

  @override
  set steps(String value) {
    _$stepsAtom.reportWrite(value, super.steps, () {
      super.steps = value;
    });
  }

  late final _$sensorStatusAtom =
      Atom(name: '_SensorCheckViewModelBase.sensorStatus', context: context);

  @override
  String get sensorStatus {
    _$sensorStatusAtom.reportRead();
    return super.sensorStatus;
  }

  @override
  set sensorStatus(String value) {
    _$sensorStatusAtom.reportWrite(value, super.sensorStatus, () {
      super.sensorStatus = value;
    });
  }

  late final _$initPedometerAsyncAction =
      AsyncAction('_SensorCheckViewModelBase.initPedometer', context: context);

  @override
  Future<void> initPedometer() {
    return _$initPedometerAsyncAction.run(() => super.initPedometer());
  }

  late final _$_SensorCheckViewModelBaseActionController =
      ActionController(name: '_SensorCheckViewModelBase', context: context);

  @override
  void onStepCount(StepCount event) {
    final _$actionInfo = _$_SensorCheckViewModelBaseActionController
        .startAction(name: '_SensorCheckViewModelBase.onStepCount');
    try {
      return super.onStepCount(event);
    } finally {
      _$_SensorCheckViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onStepCountError(dynamic error) {
    final _$actionInfo = _$_SensorCheckViewModelBaseActionController
        .startAction(name: '_SensorCheckViewModelBase._onStepCountError');
    try {
      return super._onStepCountError(error);
    } finally {
      _$_SensorCheckViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
steps: ${steps},
sensorStatus: ${sensorStatus}
    ''';
  }
}
