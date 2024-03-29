import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/patient_profile_view_body.dart';

class PatientProfileView extends StatelessWidget {
  const PatientProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OfflineBuilder(
            connectivityBuilder: (BuildContext context,
                ConnectivityResult connectivity,
                Widget child,) {
              final bool connected = connectivity != ConnectivityResult.none;
              return Stack(
                fit: StackFit.expand,
                children: [
                  connected ? const PatientProfileViewBody() : child,
                  AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    height: connected ? 0.0 : MediaQuery
                        .of(context)
                        .padding
                        .top + 25.h,
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
          child: Image.asset('assets/images/no-connection.png', fit: BoxFit.cover),
        )
    );
  }
}
