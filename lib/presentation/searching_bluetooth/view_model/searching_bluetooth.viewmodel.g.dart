// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searching_bluetooth.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchingBluetoothViewModel on _SearchingBluetoothViewModelBase, Store {
  late final _$bluetoothListAtom = Atom(
      name: '_SearchingBluetoothViewModelBase.bluetoothList', context: context);

  @override
  bool get bluetoothList {
    _$bluetoothListAtom.reportRead();
    return super.bluetoothList;
  }

  @override
  set bluetoothList(bool value) {
    _$bluetoothListAtom.reportWrite(value, super.bluetoothList, () {
      super.bluetoothList = value;
    });
  }

  late final _$_SearchingBluetoothViewModelBaseActionController =
      ActionController(
          name: '_SearchingBluetoothViewModelBase', context: context);

  @override
  void setBluetoothList(bool value) {
    final _$actionInfo = _$_SearchingBluetoothViewModelBaseActionController
        .startAction(name: '_SearchingBluetoothViewModelBase.setBluetoothList');
    try {
      return super.setBluetoothList(value);
    } finally {
      _$_SearchingBluetoothViewModelBaseActionController
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
