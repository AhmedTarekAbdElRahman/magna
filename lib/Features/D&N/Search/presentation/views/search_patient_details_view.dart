import 'package:flutter/material.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/D&N/Search/presentation/views/widgets/search_patient_details_view_body.dart';

class SearchPatientDetailsView extends StatelessWidget {
  const SearchPatientDetailsView({
    Key? key,
    required this.patientModel,
    required this.index,

  }) : super(key: key);
  final PatientModel patientModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchPatientDetailsViewBody(patientModel: patientModel, index: index),
    );
  }
}
