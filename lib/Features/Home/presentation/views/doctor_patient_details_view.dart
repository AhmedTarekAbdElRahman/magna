import 'package:flutter/material.dart';
import 'package:magna/Features/Home/presentation/views/widgets/doctor_patient_details_view_body.dart';

class DoctorPatientDetailsView extends StatelessWidget {
  const DoctorPatientDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorPatientDetailsViewBody(),
    );
  }
}
