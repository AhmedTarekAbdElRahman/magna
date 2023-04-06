import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/app_routers.dart';
import 'package:magna/Core/utils/functions/custom_toast.dart';
import 'package:magna/Core/widgets/custom_button.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import 'package:magna/Features/Profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:magna/Features/Profile/presentation/view_models/edit_profile_cubit/edit_profile_state.dart';
import '../../../../../Core/model/user_model/user_model.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../../../../Core/widgets/custom_form_field.dart';
import '../../../../../constant.dart';

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
            title: "UpdateProfile",
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.height / 9.8,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: user.image!,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[300],
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline),
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                        ),
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
                  height: 20.h,
                ),
                UpdateProfileButton(formKey: formKey, nameController: nameController, phoneController: phoneController),
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

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          showToast(
              text: state.errMessage, state: ToastStates.error);
        } else if (state is EditProfileSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            formKey: formKey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<EditProfileCubit>(context)
                    .editProfile(
                  name: nameController.text,
                  phone: phoneController.text,
                );
              }
            },
            text: 'Update',
          );
        }
      },
    );
  }
}
