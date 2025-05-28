// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_store.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepStoreViewModel on StepStoreViewModelBase, Store {
  late final _$stepsAtom =
      Atom(name: 'StepStoreViewModelBase.steps', context: context);

  @override
  int get steps {
    _$stepsAtom.reportRead();
    return super.steps;
  }

  @override
  set steps(int value) {
    _$stepsAtom.reportWrite(value, super.steps, () {
      super.steps = value;
    });
  }

  late final _$StepStoreViewModelBaseActionController =
      ActionController(name: 'StepStoreViewModelBase', context: context);

  @override
  void updateSteps(int value) {
    final _$actionInfo = _$StepStoreViewModelBaseActionController.startAction(
        name: 'StepStoreViewModelBase.updateSteps');
    try {
      return super.updateSteps(value);
    } finally {
      _$StepStoreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
steps: ${steps}
    ''';
  }
}
