import 'package:anda_ai/infra/infra.dart';
import 'package:mobx/mobx.dart';

part 'step_view_model.g.dart';

class StepViewModel = _StepViewModelBase with _$StepViewModel;

abstract class _StepViewModelBase with Store {
  final StepBluetoothService bluetoothService;

  _StepViewModelBase(this.bluetoothService);

  @observable
  int stepCount = 0;

  @action
  void onRawPacketReceived(List<int> rawData) {
    final steps = bluetoothService.extractStepsFromRawData(rawData);
    if (steps != null) {
      stepCount = steps;
    }
  }
}
