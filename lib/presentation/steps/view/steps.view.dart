import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepsView extends StatefulWidget {
  final SensorCheckViewModel sensorViewModel;
  final BleViewModel bleViewModel;

  const StepsView({
    super.key,
    required this.sensorViewModel,
    required this.bleViewModel,
  });

  @override
  State<StepsView> createState() => _StepsViewState();
}

class _StepsViewState extends State<StepsView> {
  @override
  void initState() {
    super.initState();
    widget.sensorViewModel.initPedometer().then((_) {
      if (!widget.sensorViewModel.hasSensor) {
        widget.bleViewModel.startScan();
      } else {
        widget.bleViewModel.startLocalStepCounter();
      }
    });
  }

  @override
  void dispose() {
    widget.bleViewModel.stopLocalStepCounter();
    widget.bleViewModel.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 182, 255),
      body: Observer(
        builder: (context) {
          final hasSensor = widget.sensorViewModel.hasSensor;

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 200 * width),
                  child: Lottie.asset('assets/steps_animation.json'),
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 218, 255, 96),
                  maxRadius: 90 * width,
                  child: Text(
                    hasSensor
                        ? widget.sensorViewModel.steps
                        : "${widget.bleViewModel.bleSteps}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50 * width,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
