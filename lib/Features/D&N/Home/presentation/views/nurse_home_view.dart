import 'package:flutter/material.dart';
import 'package:magna/Core/widgets/custom_app_bar.dart';
import 'widgets/nurse_patients_list_view.dart';

class NurseHomeView extends StatelessWidget {
  const NurseHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: const [
        CustomAppBar(title: 'Home'),
        NursePatientsListView(),
      ],
    );
  }
}
