import 'package:flutter/material.dart';
import 'widgets/update_patient_details_view_body.dart';

class UpdatePatientDetailsView extends StatelessWidget {
  const UpdatePatientDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: UpdatePatientDetailsViewBody(),
      ),
    );
  }
}
