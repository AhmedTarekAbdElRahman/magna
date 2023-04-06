import 'package:flutter/material.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import 'widgets/user_info_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomAppBar(title: 'Profile'),
        UserInfoSection(),
      ],
    );
  }
}

