import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/app_routers.dart';
import 'package:magna/Core/widgets/custom_form_field.dart';
import 'package:magna/constant.dart';
import 'login_button.dart';
import 'login_password_form_field.dart';

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
                CustomFormFiled(
                  controller: emailController,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter your email address';
                    }
                    return null;
                  },
                  label: 'Email',
                  prefix: Icons.email_outlined,
                ),
                SizedBox(
                  height: 10.h,
                ),
                LoginPasswordFormField(passwordController: passwordController, formKey: formKey, emailController: emailController),
                SizedBox(
                  height: 15.h,
                ),
                LoginButton(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.kRegisterView);
                      },
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

