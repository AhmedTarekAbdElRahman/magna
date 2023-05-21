import 'package:flutter/material.dart';

import '../../../../../../Core/model/patient_model/patient_model.dart';
import '../../../../../../Core/utils/app_routers.dart';
import '../../../../../../constant.dart';


class EditItemButton extends StatelessWidget {
  const EditItemButton({
    Key? key,
    required this.patientModel,
  }) : super(key: key);

  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        elevation: 5.0,
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: double.infinity,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.kUpdatePatientDetailsView,
                arguments: patientModel,
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
