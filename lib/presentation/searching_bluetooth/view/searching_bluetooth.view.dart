import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchingBluetoothView extends StatelessWidget {
  final BleViewModel bleViewModel;
  final SearchongBluetoothViewModel searchingBluetoothVM;
  const SearchingBluetoothView({
    super.key,
    required this.bleViewModel,
    required this.searchingBluetoothVM,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 182, 255),
      body: Observer(
        builder: (context) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: BottonSearchBluetooth(
                  bleViewModel: bleViewModel,
                  searchingBluetoothVM: searchingBluetoothVM,
                ),
              ),
              if (searchingBluetoothVM.bluetoothList == true)
                InkWell(
                  onTap: () {
                    searchingBluetoothVM.setBluetoothListFalse();
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color.fromARGB(108, 0, 0, 0),
                  ),
                ),
              if (searchingBluetoothVM.bluetoothList == true)
                Container(
                  width: 280 * width,
                  height: 350 * width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    //mainAxisAlignment: bleViewModel.devices.isNotEmpty ? MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {}, 
                          child: Icon(Icons.close),
                        ),
                      ),
                      SizedBox(height: 10),
                      if (bleViewModel.devices.isNotEmpty)
                        Observer(
                          builder: (_) => ListView.builder(
                            itemCount: bleViewModel.devices.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (_, index) {
                              final device = bleViewModel.devices[index];
                              return ListTile(
                                title: Text(device.platformName),
                                subtitle: Text(device.remoteId.str),
                                trailing: const Icon(Icons.bluetooth),
                                onTap: () async {
                                  await bleViewModel.connectToDevice(device);
                                  await bleViewModel.subscribeToSteps(
                                    device,
                                    Guid(
                                      '6e400001-b5a3-f393-e0a9-e50e24dcca9e',
                                    ),
                                    Guid(
                                      '6e400003-b5a3-f393-e0a9-e50e24dcca9e',
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                      else
                        Expanded(
                          child: Center(
                            child: Text(
                              "Não foram encontrados dispositivos",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
