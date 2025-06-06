import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottonSearchBluetooth extends StatelessWidget {
  final BleViewModel bleViewModel;
  final SearchongBluetoothViewModel searchingBluetoothVM;
  const BottonSearchBluetooth({
    super.key,
    required this.bleViewModel,
    required this.searchingBluetoothVM,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 375;
    final vm = bleViewModel;
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Align(
          alignment: Alignment.center,
          child: ArcText(
            radius: 120,
            text: 'VAMOS   TENTAR   VIA   BLUETOOTH',
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            startAngle: -4.70 / 2,
            placement: Placement.inside,
            direction: Direction.clockwise,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Observer(
            builder: (context) {
              return InkWell(
                onTap: () {
                  vm.startScan();
                  searchingBluetoothVM.setBluetoothListTrue();
                },
                child: Container(
                  width: 150 * width,
                  height: 150 * width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 255, 96),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.bluetooth,
                    color: Colors.white,
                    size: 100 * width,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
