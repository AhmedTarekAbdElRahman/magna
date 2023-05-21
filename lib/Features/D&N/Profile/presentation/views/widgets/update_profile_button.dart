import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../view_models/edit_profile_cubit/edit_profile_cubit.dart';
import '../../view_models/edit_profile_cubit/edit_profile_state.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.image,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String image;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          showToast(
              text: state.errMessage, state: ToastStates.error);
        } else if (state is EditProfileSuccess) {
          Navigator.of(context).pop("update");
        }
      },
      builder: (context, state) {
        if (state is EditProfileImageLoading || state is EditProfileLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            formKey: formKey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<EditProfileCubit>(context)
                    .uploadProfileImage(
                  image: image,
                  name: nameController.text,
                  phone: phoneController.text,
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
