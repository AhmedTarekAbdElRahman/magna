import 'package:flutter/material.dart';

import 'widgets/nurse_patient_details_view_body.dart';

class NursePatientDetailsView extends StatelessWidget {
  const NursePatientDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NursePatientDetailsViewBody(),
    );
  }
}
