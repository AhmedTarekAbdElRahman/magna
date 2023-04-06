import 'package:flutter/material.dart';

import '../../../../../Core/utils/app_routers.dart';
import '../../../../../constant.dart';
import 'login_button.dart';

class LoginActionSection extends StatelessWidget {
  const LoginActionSection(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginButton(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.kRegisterView);
              },
              child: const Text(
                'REGISTER',
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
