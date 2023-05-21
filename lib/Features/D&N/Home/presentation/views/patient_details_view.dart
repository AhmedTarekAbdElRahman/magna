import 'package:flutter/material.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/D&N/Home/presentation/views/widgets/patient_details_view_body.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({
    Key? key,
    required this.patientModel,

  }) : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientDetailsViewBody(patientModel: patientModel),
    );
  }
}
