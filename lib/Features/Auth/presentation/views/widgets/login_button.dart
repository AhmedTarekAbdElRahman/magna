import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import '../../../../../Core/utils/app_routers.dart';
import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../view_models/sign_in_cubit/sign_in_cubit.dart';
import '../../view_models/sign_in_cubit/sign_in_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.of(context).pushReplacementNamed(Routes.kHomeView);
          showToast(text: 'Login success', state: ToastStates.success);
        } else if (state is SignInFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
          debugPrint(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            formKey: formKey,
            text: 'Login',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<SignInCubit>(context).signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
          );
        }
      },
    );
  }
}
