import 'package:mobx/mobx.dart';
part 'searching_bluetooth.viewmodel.g.dart';

class SearchingBluetoothViewModel = _SearchingBluetoothViewModelBase with _$SearchingBluetoothViewModel;

abstract class _SearchingBluetoothViewModelBase with Store {
  @observable
  bool bluetoothList = false;

  @action
  void setBluetoothList(bool value) {
    bluetoothList = value;
  }
}
