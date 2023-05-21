import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Features/Patient/presentation/views/widgets/patient_profile_action.dart';
import '../../../../../../Core/model/patient_model/patient_model.dart';
import '../../../../../../Core/utils/styles.dart';

class PatientProfileInfoSection extends StatelessWidget {
  const PatientProfileInfoSection({
    Key? key,
    required this.patientModel,
  }) : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          PatientProfileActions(patientModel: patientModel),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            title: Text('Name', style: Styles.style24BB),
            subtitle: Text(patientModel.name!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Email', style: Styles.style24BB),
            subtitle: Text(patientModel.email!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Phone', style: Styles.style24BB),
            subtitle: Text(patientModel.phone!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Gender', style: Styles.style24BB),
            subtitle: Text(patientModel.gender!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Age', style: Styles.style24BB),
            subtitle: Text(patientModel.age!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Doctor name', style: Styles.style24BB),
            subtitle: Text(patientModel.doctorName!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Lab note', style: Styles.style24BB),
            subtitle: Text(patientModel.labNote ?? 'No note yet', style: Styles.style20),
          ),
          ListTile(
            title: Text('Chest pain type', style: Styles.style24BB),
            subtitle: Text(patientModel.chestPainType!,
                style: Styles.style20),
          ),
          ListTile(
            title: Text('Cholesterol', style: Styles.style24BB),
            subtitle: Text(patientModel.cholesterol!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Exercise angina', style: Styles.style24BB),
            subtitle: Text(patientModel.exerciseAngina== '1'?'Yes':'No', style: Styles.style20),
          ),
          ListTile(
            title: Text('Fast blood sugar', style: Styles.style24BB),
            subtitle:
            Text(patientModel.fastingBloodSugar!, style: Styles.style20),
          ),
          ListTile(
            title: Text('ECG', style: Styles.style24BB),
            subtitle:
            Text(patientModel.ecg?? 'No reads yet', style: Styles.style20),
          ),
          ListTile(
            title: Text('Max heart rate', style: Styles.style24BB),
            subtitle: Text(patientModel.maxHeartRate?? 'No reads yet',
                style: Styles.style20),
          ),
          ListTile(
            title: Text('Prediction', style: Styles.style24BB),
            subtitle: Text(patientModel.prediction?? 'No prediction yet',
                style: Styles.style20),
          ),
          ListTile(
            title: Text('Doctor notes', style: Styles.style24BB),
            subtitle: Text(patientModel.description!, style: Styles.style20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          )
        ],
      ),
    );
  }
}


