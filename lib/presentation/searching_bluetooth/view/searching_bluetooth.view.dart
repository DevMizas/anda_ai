import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchingBluetoothView extends StatelessWidget {
  final BleViewModel bleViewModel;
  const SearchingBluetoothView({super.key, required this.bleViewModel});

  @override
  Widget build(BuildContext context) {
    final  width = MediaQuery.of(context).size.width / 375;
    final searchingBluetoothVM = SearchongBluetoothViewModel();
    final bleVM = bleViewModel;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 182, 255),
      body: Observer(
        builder: (context) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Center(child: BottonSearchBluetooth(bleViewModel: bleViewModel)),
              if(searchingBluetoothVM.bluetoothList == true)
              InkWell(
                onTap: () {
                  searchingBluetoothVM.setBluetoothList(false);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: const Color.fromARGB(108, 0, 0, 0),
                  
                ),
              ),
              if(searchingBluetoothVM.bluetoothList == true)
              Container(
                  width: 280 * width,
                  height: 350 * width,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Observer(
                    builder: (_) => ListView.builder(
                      itemCount: bleVM.devices.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (_, index) {
                        final device = bleVM.devices[index];
                        return ListTile(
                          title: Text(device.platformName),
                          subtitle: Text(device.remoteId.str),
                          trailing: const Icon(Icons.bluetooth),
                          onTap: () async {
                            await bleVM.connectToDevice(device);
                            await bleVM.subscribeToSteps(
                              device,
                              Guid('6e400001-b5a3-f393-e0a9-e50e24dcca9e'),
                              Guid('6e400003-b5a3-f393-e0a9-e50e24dcca9e'),
                            );
                          },
                        );
                      },
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
