import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../view_models/edit_patient_cubit/edit_patient_cubit.dart';
import '../../view_models/edit_patient_cubit/edit_patient_state.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.descriptionController,
    required this.id,
    required this.ageController,
    required this.cholesterolController,
    required this.fastingBloodSugarController,
    required this.image,
    required this.doctorId,
    required this.gender,
    required this.labNote,
    required this.labResults,
    required this.atHome,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController descriptionController;
  final String id;
  final String image;
  final TextEditingController ageController;
  final TextEditingController cholesterolController;
  final TextEditingController fastingBloodSugarController;
  final String doctorId;
  final String gender;
  final String? labNote;
  final String? labResults;
  final bool atHome;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPatientCubit, EditPatientState>(
      listener: (context, state) {
        if (state is EditPatientFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is EditPatientSuccess) {
          Navigator.of(context).pop();
        } else if (state is EditPatientImageFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is EditPatientImageLoading || state is EditPatientLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            formKey: formKey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<EditPatientCubit>(context).uploadPatientImage(
                  atHome: atHome,
                  labNote: labNote,
                  labResults: labResults,
                  id: id,
                  gender: gender,
                  doctorId: doctorId,
                  name: nameController.text,
                  phone: phoneController.text,
                  description: descriptionController.text,
                  age: ageController.text,
                  cholesterol: cholesterolController.text,
                  fastingBloodSugar: fastingBloodSugarController.text,
                  image: image,
                );
              }
            },
            text: 'Save',
          );
        }
      },
    );
  }
}
