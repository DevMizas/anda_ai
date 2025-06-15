import 'package:mobx/mobx.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

part 'sensor_check.viewmodel.g.dart';

class SensorCheckViewModel = _SensorCheckViewModelBase
    with _$SensorCheckViewModel;

abstract class _SensorCheckViewModelBase with Store {
  @observable
  String steps = "0";

  @observable
  String sensorStatusText = "Verificando sensor...";

  @observable
  bool hasSensor = false;

  @action
  Future<void> initPedometer() async {
    final status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      sensorStatusText = "Permissão não concedida para ler passos";
      hasSensor = false;
      return;
    }

    try {
      final subscription = Pedometer.stepCountStream.listen(
        (event) {},
        onError: _onStepCountError,
      );
      await Future.delayed(Duration(milliseconds: 500));
      await subscription.cancel();

      sensorStatusText = "Sensor funcionando";
      hasSensor = true;
    } catch (e) {
      sensorStatusText = "Erro ao iniciar pedômetro";
      hasSensor = false;
    }
  }

  @action
  void onStepCount(StepCount event) {
    steps = event.steps.toString();
  }

  @action
  void _onStepCountError(error) {
    sensorStatusText = "Sensor não disponível";
    hasSensor = false;
  }
}
