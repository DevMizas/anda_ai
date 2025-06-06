import 'package:mobx/mobx.dart';
part 'searching_bluetooth.viewmodel.g.dart';

class SearchongBluetoothViewModel = _SearchongBluetoothViewModelBase with _$SearchongBluetoothViewModel;

abstract class _SearchongBluetoothViewModelBase with Store {
  @observable
  bool bluetoothList = false;

  @action
  void setBluetoothListTrue() {
    bluetoothList = true;
  }

  @action
  void setBluetoothListFalse() {
    bluetoothList = false;
  }
}
