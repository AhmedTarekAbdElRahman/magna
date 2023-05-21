import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/Core/widgets/confirm_password_field.dart';
import 'package:magna/Features/Auth/presentation/views/widgets/change_password_button.dart';

import '../../../../../Core/widgets/new_passord_form_field.dart';
import '../../../../../Core/widgets/password_form_field.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({Key? key, required this.email})
      : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var confirmPasswordController = TextEditingController();
    var passwordController = TextEditingController();
    var newPasswordController = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PasswordFormField(
                passwordController: passwordController,
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  'Write your new password ...',
                  style: Styles.style20BB,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              NewPasswordFormField(
                newPasswordController: newPasswordController,
              ),
              SizedBox(
                height: 10.h,
              ),
              ConfirmPasswordFormField(
                confirmPasswordController: confirmPasswordController,
                passwordController: newPasswordController,
              ),
              SizedBox(
                height: 15.h,
              ),
              ChangePasswordButton(
                formKey: formKey,
                newPasswordController: newPasswordController,
                passwordController: passwordController,
                email: email,
              )
            ],
          ),
        ),
      ),
    );
  }
}
