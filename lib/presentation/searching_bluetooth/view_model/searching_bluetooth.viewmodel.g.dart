// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searching_bluetooth.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchongBluetoothViewModel on _SearchongBluetoothViewModelBase, Store {
  Computed<bool>? _$bluetoothListComputed;

  @override
  bool get bluetoothList =>
      (_$bluetoothListComputed ??= Computed<bool>(() => super.bluetoothList,
              name: '_SearchongBluetoothViewModelBase.bluetoothList'))
          .value;

  late final _$_bluetoothListAtom = Atom(
      name: '_SearchongBluetoothViewModelBase._bluetoothList',
      context: context);

  @override
  bool get _bluetoothList {
    _$_bluetoothListAtom.reportRead();
    return super._bluetoothList;
  }

  @override
  set _bluetoothList(bool value) {
    _$_bluetoothListAtom.reportWrite(value, super._bluetoothList, () {
      super._bluetoothList = value;
    });
  }

  late final _$_SearchongBluetoothViewModelBaseActionController =
      ActionController(
          name: '_SearchongBluetoothViewModelBase', context: context);

  @override
  void setBluetoothList(bool value) {
    final _$actionInfo = _$_SearchongBluetoothViewModelBaseActionController
        .startAction(name: '_SearchongBluetoothViewModelBase.setBluetoothList');
    try {
      return super.setBluetoothList(value);
    } finally {
      _$_SearchongBluetoothViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bluetoothList: ${bluetoothList}
    ''';
  }
}
