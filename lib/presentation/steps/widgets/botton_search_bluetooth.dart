import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottonSearchBluetooth extends StatelessWidget {
  final BleViewModel bleViewModel;
  const BottonSearchBluetooth({
    super.key,
    required this.bleViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 375;
    final vm = bleViewModel;
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        // Observer(
        //   builder: (_) => ListView.builder(
        //     itemCount: vm.devices.length,
        //     physics: const BouncingScrollPhysics(),
        //     itemBuilder: (_, index) {
        //       final device = vm.devices[index];
        //       return ListTile(
        //         title: Text(device.platformName),
        //         subtitle: Text(device.remoteId.str),
        //         trailing: const Icon(Icons.bluetooth),
        //         onTap: () async {
        //           await vm.connectToDevice(device);
        //           await vm.subscribeToSteps(
        //             device,
        //             Guid('6e400001-b5a3-f393-e0a9-e50e24dcca9e'),
        //             Guid('6e400003-b5a3-f393-e0a9-e50e24dcca9e'),
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ),
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
          child: InkWell(
            onTap: () {
              vm.startScan();
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
          ),
        ),
      ],
    );
  }
}
