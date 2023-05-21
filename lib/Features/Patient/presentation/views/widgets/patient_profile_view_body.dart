import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/widgets/custom_error_widget.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import 'package:magna/Features/Patient/presentation/views/widgets/patient_profile_info_section.dart';
import '../../../../../Core/widgets/custom_sliver_app_bar.dart';
import '../../view_models/get_patient_profile_cubit/get_patient_profile_cubit.dart';
import '../../view_models/get_patient_profile_cubit/get_patient_profile_state.dart';

class PatientProfileViewBody extends StatelessWidget {
  const PatientProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatientProfileCubit, GetPatientProfileState>(
      builder: (context, state) {
        if(state is GetPatientProfileFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else if(state is GetPatientProfileSuccess){
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                text: 'Profile',
                image:state.patientModel.image!,
                id: state.patientModel.id!,
              ),
              SliverList(delegate: SliverChildListDelegate([
                PatientProfileInfoSection(patientModel: state.patientModel,),
              ])),
            ],
          );
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
