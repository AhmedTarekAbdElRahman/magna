import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import 'register_button.dart';

class RegisterActionSection extends StatelessWidget {
  const RegisterActionSection({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterButton(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
          nameController: nameController,
          phoneController: phoneController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an email!'),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ))
          ],
        ),
      ],
    );
  }
}