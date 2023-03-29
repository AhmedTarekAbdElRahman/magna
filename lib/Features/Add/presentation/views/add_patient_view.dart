import 'package:flutter/material.dart';
import 'package:magna/Features/Add/presentation/views/widgets/add_patient_view_body.dart';
class AddPatientView extends StatelessWidget {
  const AddPatientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child:AddPatientViewBody(),
      ),
    );
  }
}
