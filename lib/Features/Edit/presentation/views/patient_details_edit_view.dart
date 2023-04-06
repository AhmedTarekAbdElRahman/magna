import 'package:flutter/material.dart';
import 'widgets/patient_details_edit_view_body.dart';

class PatientDetailsEditView extends StatelessWidget {
  const PatientDetailsEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PatientDetailsEditViewBody(),
    );
  }
}
