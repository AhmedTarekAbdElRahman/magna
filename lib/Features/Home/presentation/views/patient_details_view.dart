import 'package:flutter/material.dart';
import 'package:magna/Features/Home/presentation/views/widgets/patient_details_view_body.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PatientDetailsViewBody(),
      ),
    );
  }
}
