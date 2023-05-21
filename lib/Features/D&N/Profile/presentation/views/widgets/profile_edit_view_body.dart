import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/model/user_model/user_model.dart';
import '../../../../../../Core/widgets/custom_app_bar.dart';
import '../../../../../../Core/widgets/custom_form_field.dart';
import 'change_profile_image_widget.dart';
import 'update_profile_button.dart';

class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var nameController = TextEditingController(text: user.name);
    var phoneController = TextEditingController(text: user.phone);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomAppBar(
            title: "Update Profile",
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ChangeProfileImageWidget(image: user.image!),
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
                  height: 20.h,
                ),
                UpdateProfileButton(
                    formKey: formKey,
                    nameController: nameController,
                    phoneController: phoneController,
                  image: user.image!,
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

