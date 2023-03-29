import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/custom_form_field.dart';
import '../../view_models/sign_in_cubit/sign_in_cubit.dart';

class LoginPasswordFormField extends StatefulWidget {
  const LoginPasswordFormField({
    Key? key,
    required this.passwordController,
    required this.formKey,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  State<LoginPasswordFormField> createState() => _LoginPasswordFormFieldState();
}

class _LoginPasswordFormFieldState extends State<LoginPasswordFormField> {
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
      onSubmit: (value) {
        if (widget.formKey.currentState!.validate()) {
          BlocProvider.of<SignInCubit>(context).signIn(
              email: widget.emailController.text,
              password: widget.passwordController.text);
        }
      },
    );
  }
}
