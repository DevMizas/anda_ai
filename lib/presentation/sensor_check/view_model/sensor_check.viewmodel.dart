import 'package:mobx/mobx.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

part 'sensor_check.viewmodel.g.dart';

class SensorCheckViewModel = _SensorCheckViewModelBase with _$SensorCheckViewModel;

abstract class _SensorCheckViewModelBase with Store {
  final Stream<StepCount>? _stepCountStream = Pedometer.stepCountStream;

  @observable
  String steps = '0';

  @observable
  String sensorStatus = 'Verificando sensor...';

  @action
  Future<void> initPedometer() async {
    final status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
        sensorStatus = 'Permissão não concedida para ler passos';
      return;
    }

    try {
      _stepCountStream!.listen(onStepCount).onError(_onStepCountError);
        sensorStatus = 'Sensor funcionando';
    } catch (e) {
        sensorStatus = 'Erro ao iniciar pedômetro';
    }
  }

  @action
  void onStepCount(StepCount event) {
      steps = event.steps.toString();
  }

  @action
  void _onStepCountError(error) {
      sensorStatus = 'Sensor de passos não disponível neste dispositivo';
  }
}