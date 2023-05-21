import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/app_routers.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/Features/D&N/Profile/presentation/views/widgets/profile_button.dart';
import '../../../../../Core/model/patient_model/patient_model.dart';
import '../../../../D&N/Profile/presentation/views/widgets/sign_out_button.dart';
import 'patient_profile_edit_button.dart';

class PatientProfileActions extends StatelessWidget {
  const PatientProfileActions({
    Key? key,
    required this.patientModel,
  }) : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             const SignOutButton(),
            if(patientModel.atHome!)SizedBox(
              width: 5.w,
            ),
            if(patientModel.atHome!)UploadLabResultButton(patientModel: patientModel),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ProfileButton(
                function: () {
                  Navigator.pushNamed(context, Routes.kChangePasswordView,arguments: patientModel.email);
                },
                child: Text(
                  'Change your password',
                  style: Styles.style18B,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
