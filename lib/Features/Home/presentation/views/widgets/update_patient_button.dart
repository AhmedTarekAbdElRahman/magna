import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../view_models/edit_patient_cubit/edit_patient_cubit.dart';
import '../../view_models/edit_patient_cubit/edit_patient_state.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.descriptionController, required this.id,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController descriptionController;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPatientCubit,EditPatientState>(
      listener: (context, state) {
        if(state is EditPatientFailure){
          showToast(text: state.errMessage, state: ToastStates.error);
        }else if(state is EditPatientSuccess){
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if(state is EditPatientLoading){
          return const CustomLoadingIndicator();
        }else{
          return CustomButton(
            formKey: formKey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<EditPatientCubit>(context)
                    .editPatient(
                  id:id,
                  name: nameController.text,
                  phone: phoneController.text,
                  description: descriptionController.text,
                );
              }
            },
            text: 'Update',
          );
        }
      },
    );
  }
}