// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import 'package:anda_ai/core/core.dart';
import 'package:anda_ai/presentation/presentation.dart';

class SensorCheckView extends StatefulWidget {
  final sensorCheckViewModel = SensorCheckViewModel();
  SensorCheckView({
    super.key,
  });

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
    final width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 182, 255),
      body: Observer(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.sensorCheckViewModel.hasSensor == false)
                Lottie.asset('assets/error_animation.json'),
              SizedBox(
                height: widget.sensorCheckViewModel.hasSensor == false
                    ? 40 * width
                    : MediaQuery.of(context).size.height / 2,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.sensorCheckViewModel.sensorStatusText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 140 * width),
              InkWell(
                onTap: () {
                  if(widget.sensorCheckViewModel.hasSensor == false) {
                    Navigator.pushNamed(context, AppRoutes.searchingBluetooth);
                  } else {
                    Navigator.pushNamed(context, AppRoutes.steps);
                  }
                },
                child: Container(
                  width: 290 * width,
                  height: 70 * width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24 * width),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 255, 96),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        widget.sensorCheckViewModel.hasSensor == false
                            ? "Buscar via Bluetooth"
                            : "Bora andar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
