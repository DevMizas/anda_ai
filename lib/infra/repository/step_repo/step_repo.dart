import 'package:anda_ai/infra/infra.dart';
import 'package:anda_ai/presentation/presentation.dart';

class StepRepository {
  final StepStoreViewModel store = StepStoreViewModel();
  final StepService service = StepService();

  void initialize() {
    service.getStepCountStream().listen((event) {
      store.updateSteps(event.steps);
    });
  }
}
