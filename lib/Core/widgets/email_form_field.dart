import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: emailController,
      type: TextInputType.emailAddress,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your email address';
        }
        return null;
      },
      label: 'Email',
      prefix: Icons.email_outlined,
    );
  }
}
