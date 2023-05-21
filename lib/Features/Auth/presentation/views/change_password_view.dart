import 'package:flutter/material.dart';
import '../../../../Core/utils/styles.dart';
import 'widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key, required this.email}) : super(key: key);
final String email;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: Styles.style24B,
        ),
        actions: [
          Image.asset('assets/images/MAGNA.jpg')
        ],
      ),
      body: ChangePasswordViewBody(email: email,),
    );
  }
}
