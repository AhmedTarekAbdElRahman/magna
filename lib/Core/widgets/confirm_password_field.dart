import 'package:flutter/material.dart';
import 'custom_form_field.dart';

class ConfirmPasswordFormField extends StatefulWidget {
  const ConfirmPasswordFormField({
    Key? key,
    required this.confirmPasswordController, required this.passwordController,
  }) : super(key: key);

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  State<ConfirmPasswordFormField> createState() => _ConfirmPasswordFormFieldState();
}

class _ConfirmPasswordFormFieldState extends State<ConfirmPasswordFormField> {
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: widget.confirmPasswordController,
      type: TextInputType.visiblePassword,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your confirmPassword';
        }
        if(widget.passwordController.text != widget.confirmPasswordController.text){
          return 'Please,re-write the password correctly';
        }
        return null;
      },
      label: 'Confirm Password',
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
