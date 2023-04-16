import 'package:flutter/material.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/Home/presentation/views/widgets/patient_details_view_body.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PatientModel? patientModel=ModalRoute.of(context)!.settings.arguments as PatientModel?;
    return  Scaffold(
      body: PatientDetailsViewBody(patientModel: patientModel!),
    );
  }
}
