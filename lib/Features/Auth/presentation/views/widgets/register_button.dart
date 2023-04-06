import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_up_cubit/sign_up_state.dart';
import 'package:magna/constant.dart';
import '../../../../../Core/utils/app_routers.dart';
import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../view_models/sign_up_cubit/sign_up_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
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
    return BlocConsumer<SignUpCubit,SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
            Navigator.of(context).pushReplacementNamed(Routes.kLoginView);
            showToast(text: 'Register success', state: ToastStates.success);
        } else if (state is SignUpFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
          debugPrint(state.errMessage);
        }else if(state is PostUserDataFailure){
          showToast(text: state.errMessage, state: ToastStates.error);
          debugPrint(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading || state is PostUserDataLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
              formKey: formKey,
              text: 'Register',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<SignUpCubit>(context).signUp(
                    name: nameController.text,
                    role: userRole,
                    phone: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
              });
        }
      },
    );
  }
}
