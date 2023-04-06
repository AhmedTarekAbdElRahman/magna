import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/model/user_model/user_model.dart';
import 'profile_edit_button.dart';
import 'sign_out_button.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({
    Key? key, required this.user,
  }) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SignOutButton(),
        SizedBox(width: 5.w,),
        ProfileEditButton(user: user),
      ],
    );
  }
}
