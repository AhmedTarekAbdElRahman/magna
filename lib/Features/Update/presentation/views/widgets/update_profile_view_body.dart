import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/custom_button.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../../../../Core/widgets/custom_form_field.dart';
import '../../../../../constant.dart';

class ProfileUpdateViewBody extends StatelessWidget {
  const ProfileUpdateViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var nameController = TextEditingController(text: 'Ahmed Tarek');
    var phoneController = TextEditingController(text: '01140379370');
    var emailController = TextEditingController(text: 'ahmed@gamil.com');
    var passwordController = TextEditingController(text: '123456');

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomAppBar(
            title: "UpdateProfile",
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomFormFiled(
                  controller: nameController,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter your name';
                    }
                    return null;
                  },
                  label: 'Username',
                  prefix: Icons.person,
                  isPassword: false,
                ),
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
                  label: 'phone',
                  prefix: Icons.phone,
                  isPassword: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormFiled(
                  controller: emailController,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter your Email';
                    }
                    return null;
                  },
                  label: 'Email',
                  prefix: Icons.email,
                  isPassword: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormFiled(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter your password';
                    }
                    return null;
                  },
                  label: 'Password',
                  prefix: Icons.phone,
                  isPassword: false,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  formKey: formKey,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      return Navigator.of(context).pop();
                    }
                  },
                  text: 'Update',
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
