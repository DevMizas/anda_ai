import 'package:pedometer/pedometer.dart';

class StepService {
  Stream<StepCount> getStepCountStream() {
    return Pedometer.stepCountStream;
  }
}
