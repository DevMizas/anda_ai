import 'package:anda_ai/core/core.dart';
import 'package:anda_ai/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchingBluetoothView extends StatelessWidget {
  final BleViewModel bleViewModel;
  final SearchingBluetoothViewModel searchingBluetoothVM;

  const SearchingBluetoothView({
    super.key,
    required this.bleViewModel,
    required this.searchingBluetoothVM,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 182, 255),
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
              if (searchingBluetoothVM.bluetoothList)
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
              if (searchingBluetoothVM.bluetoothList)
                Container(
                  width: 280 * width,
                  height: 350 * width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            searchingBluetoothVM.setBluetoothList(false);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Observer(
                          builder: (_) {
                            if (bleViewModel.devices.isEmpty) {
                              return const Center(
                                child: Text(
                                  "Não foram encontrados dispositivos",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }

                            return ListView.builder(
                              itemCount: bleViewModel.devices.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (_, index) {
                                final device = bleViewModel.devices[index];
                                return ListTile(
                                  title: Text(
                                    device.platformName
                                  ),
                                  subtitle: Text(device.remoteId.str),
                                  trailing: const Icon(Icons.bluetooth),
                                  onTap: () async {
                                    await bleViewModel.connect(device);
                                    searchingBluetoothVM.setBluetoothList(
                                      false,
                                    );

                                    if (context.mounted) {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.steps,
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          },
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
