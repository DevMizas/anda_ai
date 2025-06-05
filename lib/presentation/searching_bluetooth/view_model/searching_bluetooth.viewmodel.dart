import 'package:mobx/mobx.dart';
part 'searching_bluetooth.viewmodel.g.dart';

class SearchongBluetoothViewModel = _SearchongBluetoothViewModelBase with _$SearchongBluetoothViewModel;

abstract class _SearchongBluetoothViewModelBase with Store {
  @observable
  bool _bluetoothList = false;

  @computed
  bool get bluetoothList => _bluetoothList;

  @action
  void setBluetoothList(bool value) {
    _bluetoothList = value;
  }
}