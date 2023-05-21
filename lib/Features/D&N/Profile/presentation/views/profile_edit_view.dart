import 'package:flutter/material.dart';
import '../../../../../Core/model/user_model/user_model.dart';
import 'widgets/profile_edit_view_body.dart';


class ProfileEditView extends StatelessWidget {
  const ProfileEditView({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserModel? user=ModalRoute.of(context)!.settings.arguments as UserModel?;
    return Scaffold(
      body: ProfileEditViewBody(user: user!),
    );
  }
}
