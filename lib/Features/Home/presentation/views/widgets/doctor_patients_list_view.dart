import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:magna/Core/widgets/custom_error_widget.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import 'package:magna/Features/Home/presentation/view_models/get_patients_cubit/get_patients_cubit.dart';
import 'package:magna/Features/Home/presentation/view_models/get_patients_cubit/get_patients_state.dart';
import '../../../../../Core/utils/styles.dart';
import 'delete_item_button.dart';
import 'doctor_patients_list_view_item.dart';
import 'edit_item_button.dart';

class DoctorPatientsListView extends StatelessWidget {
  const DoctorPatientsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatientsCubit, GetPatientsState>(
      builder: (context, state) {
        if (state is GetPatientsFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else if (state is GetDoctorPatientsSuccess) {
          if (state.patientModel.isEmpty) {
            return Expanded(
              child: Center(
                child: Text('No Patients Yet', style: Styles.style24B),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.patientModel.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.25,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            EditItemButton(
                              patientModel: state.patientModel[index],
                            ),
                            DeleteItemButton(
                              patientId: state.patientModel[index].id!,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  child: DoctorPatientsListViewItem(
                    patientModel: state.patientModel[index],
                    index: index,
                  ),
                );
              },
            ),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
