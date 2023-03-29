import 'package:flutter/material.dart';
import 'package:magna/Features/Home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:magna/Features/Home/presentation/views/widgets/patients_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
        CustomHomeAppBar(),
        PatientsListView(),
      ],
    );
  }
}

