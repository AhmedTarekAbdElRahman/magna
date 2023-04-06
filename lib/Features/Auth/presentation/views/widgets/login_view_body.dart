import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/constant.dart';
import 'login_action_section.dart';
import '../../../../../Core/widgets/password_form_field.dart';
import '../../../../../Core/widgets/email_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

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
                  'Login',
                  style: Styles.style24B.copyWith(color: kPrimaryColor),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              EmailFormField(
                emailController: emailController,
              ),
              SizedBox(
                height: 10.h,
              ),
              PasswordFormField(
                  passwordController: passwordController,
                  formKey: formKey,
                  ),
              SizedBox(
                height: 15.h,
              ),
              LoginActionSection(
                emailController: emailController,
                passwordController: passwordController,
                formKey: formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
