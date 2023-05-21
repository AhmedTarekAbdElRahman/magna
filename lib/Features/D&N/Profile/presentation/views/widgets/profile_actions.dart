import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Features/D&N/Profile/presentation/views/widgets/profile_button.dart';
import '../../../../../../Core/model/user_model/user_model.dart';
import '../../../../../../Core/utils/app_routers.dart';
import 'profile_edit_button.dart';
import 'sign_out_button.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({
    Key? key, required this.user,
  }) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SignOutButton(),
            SizedBox(width: 5.w,),
            ProfileEditButton(user: user),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ProfileButton(
                function: () {
                  Navigator.pushNamed(context, Routes.kChangePasswordView,arguments: user.email);
                },
                child: Text(
                  'Change your password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
