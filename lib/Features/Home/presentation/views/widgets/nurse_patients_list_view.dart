import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/widgets/custom_error_widget.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import 'package:magna/Features/Home/presentation/view_models/get_patients_cubit/get_patients_cubit.dart';
import 'package:magna/Features/Home/presentation/view_models/get_patients_cubit/get_patients_state.dart';
import 'nurse_patients_list_view_item.dart';

class NursePatientsListView extends StatelessWidget {
  const NursePatientsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatientsCubit,GetPatientsState>(
      builder: (context, state) {
        if(state is GetPatientsSuccess){
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.patientModel.length,
              itemBuilder:(context, index) {
                return NursePatientsListViewItem(patientModel:state.patientModel[index] ,);
              },
            ),
          );
        }else if(state is GetPatientsFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
