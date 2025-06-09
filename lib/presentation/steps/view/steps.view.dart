import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Stepsiew extends StatelessWidget {
  final BleViewModel bleViewModel;
  const Stepsiew({super.key, required this.bleViewModel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 375;
    final vm = bleViewModel;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 182, 255),
      body: SizedBox(
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
              backgroundColor: Color.fromARGB(255, 218, 255, 96),
              maxRadius: 90 * width,
              child: Text(
                "${vm.bleSteps}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50 * width,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
