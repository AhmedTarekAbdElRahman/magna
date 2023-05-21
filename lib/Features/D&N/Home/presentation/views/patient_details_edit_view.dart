import 'package:flutter/material.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'widgets/patient_details_edit_view_body.dart';

class PatientDetailsEditView extends StatelessWidget {
  const PatientDetailsEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PatientModel? patientModel=ModalRoute.of(context)!.settings.arguments as PatientModel?;
    return Scaffold(
      body: PatientDetailsEditViewBody(patientModel: patientModel!),
    );
  }
}
