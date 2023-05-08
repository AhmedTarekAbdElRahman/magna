import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/confirm_password_field.dart';
import 'package:magna/Core/widgets/email_form_field.dart';
import 'package:magna/Core/widgets/password_form_field.dart';
import 'package:magna/constant.dart';
import '../../../../../Core/widgets/role_button.dart';
import '../../../../../Core/widgets/name_form_field.dart';
import '../../../../../Core/widgets/phone_form_field.dart';
import 'register_action_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              NameFormField(nameController: nameController),
              SizedBox(
                height: 10.h,
              ),
              PhoneFormField(phoneController: phoneController),
              SizedBox(
                height: 10.h,
              ),
              EmailFormField(emailController: emailController),
              SizedBox(
                height: 10.h,
              ),
              PasswordFormField(
                passwordController: passwordController,
              ),
              SizedBox(
                height: 10.h,
              ),
              ConfirmPasswordFormField(confirmPasswordController: confirmPasswordController,passwordController: passwordController),
              SizedBox(
                height: 10.h,
              ),
              const DoctorRole(
                text: 'Role:',
                dropdownValue: roleList,
              ),
              SizedBox(
                height: 15.h,
              ),
              RegisterActionSection(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
                nameController: nameController,
                phoneController: phoneController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
