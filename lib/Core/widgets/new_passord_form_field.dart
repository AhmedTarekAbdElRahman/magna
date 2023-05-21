import 'package:flutter/material.dart';
import 'custom_form_field.dart';

class NewPasswordFormField extends StatefulWidget {
  const NewPasswordFormField({
    Key? key,
    required this.newPasswordController,
  }) : super(key: key);

  final TextEditingController newPasswordController;

  @override
  State<NewPasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<NewPasswordFormField> {
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: widget.newPasswordController,
      type: TextInputType.visiblePassword,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your new password';
        }
        return null;
      },
      label: 'New Password',
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
