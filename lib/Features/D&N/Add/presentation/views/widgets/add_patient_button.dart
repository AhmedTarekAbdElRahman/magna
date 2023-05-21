import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../../../../../constant.dart';
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
    required this.emailController,
    required this.passwordController,
    required this.doctorName,
    required this.confirmPasswordController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final String doctorName;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
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
          Navigator.of(context).pop();
        }else if (state is CreatePatientFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        }
        else if (state is PostPatientRoleFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        }

      },
      builder: (context, state) {
        if (state is AddImageLoading || state is AddPatientLoading||state is CreatePatientLoading||state is PostPatientRoleLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            formKey: formKey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AddPatientCubit>(context).uploadPatientImage(
                  doctorName: doctorName,
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  phone: phoneController.text,
                  description: descriptionController.text,
                  age: ageController.text,
                  cholesterol: cholesterolController.text,
                  fastingBloodSugar: fastingBloodSugarController.text,
                );
              }

            },
            text: 'Add',
          );
        }
      },
    );
  }
}
