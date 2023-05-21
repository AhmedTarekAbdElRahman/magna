import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/widgets/custom_button.dart';
import 'package:magna/Features/Auth/presentation/view_models/change_password_cubit/change_password_cubit.dart';
import 'package:magna/Features/Auth/presentation/view_models/change_password_cubit/change_password_state.dart';

import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton(
      {Key? key,
      required this.formKey,
      required this.newPasswordController,
      required this.passwordController,
      required this.email})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final TextEditingController passwordController;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is ChangePasswordSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if ( state is ChangePasswordLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            formKey: formKey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ChangePasswordCubit>(context).changePassword(
                  oldPassword: passwordController.text,
                  newPassword: newPasswordController.text,
                  email: email,
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
