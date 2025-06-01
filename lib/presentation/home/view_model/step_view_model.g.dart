// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepViewModel on _StepViewModelBase, Store {
  late final _$stepCountAtom =
      Atom(name: '_StepViewModelBase.stepCount', context: context);

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

  late final _$_StepViewModelBaseActionController =
      ActionController(name: '_StepViewModelBase', context: context);

  @override
  void onRawPacketReceived(List<int> rawData) {
    final _$actionInfo = _$_StepViewModelBaseActionController.startAction(
        name: '_StepViewModelBase.onRawPacketReceived');
    try {
      return super.onRawPacketReceived(rawData);
    } finally {
      _$_StepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stepCount: ${stepCount}
    ''';
  }
}
