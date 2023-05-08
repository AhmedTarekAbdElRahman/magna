import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Features/Home/presentation/views/widgets/doctor_patients_list_view.dart';
import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../../../../constant.dart';
import '../../view_models/add_patient_cubit/add_patient_cubit.dart';
import '../../view_models/add_patient_cubit/add_patient_state.dart';

class AddPatientButton extends StatelessWidget {
  const AddPatientButton({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.descriptionController,
    required this.ageController,
    required this.cholesterolController,
    required this.fastingBloodSugarController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController descriptionController;
  final TextEditingController ageController;
  final TextEditingController cholesterolController;
  final TextEditingController fastingBloodSugarController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPatientCubit, AddPatientState>(
      listener: (context, state) {
        if (state is AddPatientFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is AddPatientSuccess) {
          showToast(text: 'Added successfully', state: ToastStates.success);
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is AddImageLoading || state is AddPatientLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            formKey: formKey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AddPatientCubit>(context).uploadPatientImage(
                  name: nameController.text,
                  phone: phoneController.text,
                  description: descriptionController.text,
                  age: ageController.text,
                  cholesterol: cholesterolController.text,
                  fastingBloodSugar: fastingBloodSugarController.text,
                );
                patientGender = 'Male';
                exerciseAnginaState = 'Yes';
                chestPainType = 'typicalAngina';
              }
            },
            text: 'Add',
          );
        }
      },
    );
  }
}
