import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_form_field.dart';

class RegisterPasswordFormField extends StatefulWidget {
  const RegisterPasswordFormField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  State<RegisterPasswordFormField> createState() => _RegisterPasswordFormFieldState();
}

class _RegisterPasswordFormFieldState extends State<RegisterPasswordFormField> {
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
      suffix: isPassword ? Icons.visibility:Icons.visibility_off,
      suffixPress: () {
        setState(() {
          isPassword=!isPassword;
        });
      },
    );
  }
}
