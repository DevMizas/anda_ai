import 'package:mobx/mobx.dart';
part 'step_store.viewmodel.g.dart';

class StepStoreViewModel = StepStoreViewModelBase with _$StepStoreViewModel;

abstract class StepStoreViewModelBase with Store {
  @observable
  int steps = 0;

  @action
  void updateSteps(int value) {
    steps = value;
  }
}
