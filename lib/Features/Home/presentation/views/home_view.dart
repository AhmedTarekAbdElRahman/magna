import 'package:flutter/material.dart';
import 'package:magna/Core/utils/app_routers.dart';
import 'package:magna/Features/Home/presentation/views/widgets/home_view_body.dart';
import '../../../../Core/widgets/custom_floating_action_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: HomeViewBody(),
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icons.person_add_alt_rounded,
        function: () => Navigator.of(context).pushNamed(Routes.kAddPatientView),
      ),
    );
  }
}
