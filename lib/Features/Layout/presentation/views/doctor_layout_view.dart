import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:magna/Core/utils/app_routers.dart';
import '../../../../constant.dart';

class DoctorLayoutView extends StatefulWidget {
  const DoctorLayoutView({Key? key}) : super(key: key);

  @override
  State<DoctorLayoutView> createState() => _DoctorLayoutViewState();
}

class _DoctorLayoutViewState extends State<DoctorLayoutView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              connected ? doctorScreens[_currentIndex] : child,
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                height: connected ? 0.0 : 50.0,
                left: 0.0,
                right: 0.0,
                child: AnimatedContainer(
                  alignment: Alignment.bottomCenter,
                  duration: const Duration(milliseconds: 350),
                  color: connected ? Colors.green : Colors.red,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: connected
                        ? const Text(
                            'Connected',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            'Disconnected',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
        child: Image.asset('assets/images/no-connection.png', fit: BoxFit.fill),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          if (index == 2) {
            Navigator.of(context).pushNamed(Routes.kAddPatientView);
          } else {
            setState(() => _currentIndex = index);
          }
        },
        items: doctorBottomNavyBarItem,
      ),
    );
  }
}
