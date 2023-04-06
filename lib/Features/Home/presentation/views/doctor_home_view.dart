import 'package:flutter/material.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import 'widgets/doctor_patients_list_view.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomAppBar(title: 'Home'),
        DoctorPatientsListView(),
      ],
    );
  }
}
