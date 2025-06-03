import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SensorCheckView extends StatefulWidget {
  final sensorCheckViewModel = SensorCheckViewModel();
  SensorCheckView({super.key});

  @override
  State<SensorCheckView> createState() => _SensorCheckViewState();
}

class _SensorCheckViewState extends State<SensorCheckView> {
  @override
  void initState() {
    super.initState();
    widget.sensorCheckViewModel.initPedometer();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            widget.sensorCheckViewModel.sensorStatus,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      },
    );
  }
}
