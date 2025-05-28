import 'package:anda_ai/infra/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final StepRepository repo = StepRepository();
Stream<StepCount>? _stepCountStream;
  String _steps = '0';
  String _status = 'Verificando sensor...';

  @override
  void initState() {
    super.initState();
    _initPedometer();
  }

  Future<void> _initPedometer() async {
    final status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      setState(() {
        _status = 'Permissão não concedida para ler passos';
      });
      return;
    }

    try {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream!.listen(_onStepCount).onError(_onStepCountError);
      setState(() {
        _status = 'Sensor funcionando';
      });
    } catch (e) {
      setState(() {
        _status = 'Erro ao iniciar pedômetro';
      });
    }
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void _onStepCountError(error) {
    setState(() {
      _status = 'Sensor de passos não disponível neste dispositivo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Passos: $_steps',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(_status, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
