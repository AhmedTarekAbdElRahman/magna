import 'package:flutter/material.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Core/utils/styles.dart';
import '../../../../../../Core/utils/app_routers.dart';
import '../../../../D&N/Profile/presentation/views/widgets/profile_button.dart';


class UploadLabResultButton extends StatelessWidget {
  const UploadLabResultButton({
    Key? key,
    required this.patientModel,
  }) : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return ProfileButton(
      child: Text('Upload lab result',style: Styles.style18B,overflow:TextOverflow.fade),
      function: () {
        Navigator.of(context)
            .pushNamed(Routes.kUploadLabResultView, arguments: patientModel);
      },
    );
  }
}
