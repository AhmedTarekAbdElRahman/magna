import 'package:flutter/material.dart';
import 'custom_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: widget.passwordController,
      type: TextInputType.visiblePassword,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your password';
        }
        return null;
      },
      label: 'Password',
      prefix: Icons.lock_outline,
      isPassword: isPassword,
      suffix: isPassword?Icons.visibility:Icons.visibility_off,
      suffixPress: () {
        setState(() {
          isPassword=!isPassword;
        });
      },
    );
  }
}
