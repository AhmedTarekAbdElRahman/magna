import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../view_models/delete_patient_cubit/delete_patient_cubit.dart';
import '../../view_models/delete_patient_cubit/delete_patient_state.dart';

class DeleteItemButton extends StatelessWidget {
  const DeleteItemButton({
    Key? key,
    required this.patientId,
  }) : super(key: key);
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeletePatientCubit, DeletePatientState>(
      listener: (context, state) {
        if (state is DeletePatientFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is DeletePatientLoading) {
          return const CustomLoadingIndicator(
            color: Colors.red,
          );
        } else {
          return
            Expanded(
              child: Card(
                margin:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                elevation: 5.0,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<DeletePatientCubit>(context)
                          .deletePatient(patientId: patientId);
                    },
                    icon: const Icon(Icons.delete, color: Colors.white),
                  ),
                ),
              ),
            );

        }
      },
    );
  }
}
