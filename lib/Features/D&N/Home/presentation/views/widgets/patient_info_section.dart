import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/app_routers.dart';
import 'package:magna/Core/utils/functions/custom_toast.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import 'package:magna/Features/D&N/Home/presentation/view_models/home_service_cubit/home_service_cubit.dart';
import 'package:magna/Features/D&N/Home/presentation/view_models/home_service_cubit/home_service_state.dart';
import 'package:magna/Features/D&N/Profile/presentation/views/widgets/profile_button.dart';
import 'package:magna/constant.dart';
import '../../../../../../Core/model/patient_model/patient_model.dart';
import '../../../../../../Core/utils/styles.dart';
import '../../../../../Patient/presentation/view_models/get_patient_profile_cubit/get_patient_profile_cubit.dart';
import '../../../../../Patient/presentation/view_models/get_patient_profile_cubit/get_patient_profile_state.dart';

class PatientInfoSection extends StatelessWidget {
  const PatientInfoSection({
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
          if (role == 'D')
            BlocConsumer<HomeServiceCubit, HomeServiceState>(
              listener: (context, state) {
                BlocProvider.of<HomeServiceCubit>(context).atHome;
              },
              builder: (context, state) {
                bool atHome =
                    BlocProvider.of<HomeServiceCubit>(context).atHome ??
                        patientModel.atHome!;
                return Row(
                  children: [
                    Expanded(
                        child: ProfileButton(
                            function: () {
                              BlocProvider.of<HomeServiceCubit>(context)
                                  .homeService(
                                atHome:!atHome,
                                patientModel: patientModel
                              );
                            },
                            child: Text(
                              atHome
                                  ? 'Home Service Activated'
                                  : 'Home Service Deactivated',
                              style: Styles.style18B,
                            ))),
                  ],
                );
              },
            ),
          if (role == 'D')
            Row(
              children: [
                Expanded(
                    child: ProfileButton(
                        function: () {
                          if(patientModel.labResults == null){
                            showToast(text: 'There is no lab result yet', state: ToastStates.warning);
                          }else{
                            Navigator.pushNamed(context, Routes.kViewLabResultView,arguments: patientModel);
                          }
                        },
                        child: Text(
                          'View lap result',
                          style: Styles.style18B,
                        ))),
              ],
            ),
          ListTile(
            title: Text('Name', style: Styles.style24BB),
            subtitle: Text(patientModel.name!, style: Styles.style20),
          ),
          if(role=='N')
            ListTile(
            title: Text('Doctor name', style: Styles.style24BB),
            subtitle: Text(patientModel.doctorName!, style: Styles.style20),
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
            title: Text('Chest pain type', style: Styles.style24BB),
            subtitle: Text(patientModel.chestPainType!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Cholesterol', style: Styles.style24BB),
            subtitle: Text(patientModel.cholesterol!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Exercise angina', style: Styles.style24BB),
            subtitle: Text(patientModel.exerciseAngina!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Fast blood sugar', style: Styles.style24BB),
            subtitle:
                Text(patientModel.fastingBloodSugar!, style: Styles.style20),
          ),
          ListTile(
            title: Text('Notes', style: Styles.style24BB),
            subtitle: Text(patientModel.description!, style: Styles.style20),
          ),
          const Prediction(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          )
        ],
      ),
    );
  }
}

class Prediction extends StatelessWidget {
  const Prediction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatientProfileCubit, GetPatientProfileState>(
        builder: (context, state) {
      if (state is GetPatientProfileSuccess) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('ECG', style: Styles.style24BB),
              subtitle: Text(state.patientModel.ecg?? 'No reads yet', style: Styles.style20),
            ),
            ListTile(
              title: Text('Max heart rate', style: Styles.style24BB),
              subtitle:
                  Text(state.patientModel.maxHeartRate?? 'No reads yet', style: Styles.style20),
            ),
            ListTile(
              title: Text('Prediction', style: Styles.style24BB),
              subtitle:
                  Text(state.patientModel.prediction?? 'No prediction yet', style: Styles.style20),
            ),
          ],
        );
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
