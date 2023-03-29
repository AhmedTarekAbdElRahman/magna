import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/custom_form_field.dart';
import 'package:magna/Features/Auth/presentation/views/widgets/register_button.dart';
import 'package:magna/Features/Auth/presentation/views/widgets/register_password_form_field.dart';
import 'package:magna/constant.dart';
import '../../../../../Core/widgets/custom_drop_down_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
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
                CustomFormFiled(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please,enter your name';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: Icons.person),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormFiled(
                  controller: phoneController,
                  type: TextInputType.phone,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter your phone';
                    }
                    return null;
                  },
                  label: 'Phone',
                  prefix: Icons.phone,
                ),
                SizedBox(
                  height: 10.h,
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
                RegisterPasswordFormField(passwordController: passwordController),
                SizedBox(
                  height: 10.h,
                ),
                const CustomDropDownButton(text: 'Role:', dropdownValue: role),
                SizedBox(
                  height: 15.h,
                ),
                RegisterButton(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  name: nameController,
                  phone: phoneController,
                  role: 'doctor',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an email!'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

