import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import '../../../../../../Core/utils/app_routers.dart';
import '../../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../../constant.dart';
import '../../view_models/sign_out_cubit/sign_out_cubit.dart';
import '../../view_models/sign_out_cubit/sign_out_state.dart';
import 'profile_button.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.kLoginView,(route) => false,);
        } else if (state is SignOutFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is SignOutLoading) {
          return const CustomLoadingIndicator();
        } else {
          return Expanded(
            flex: 3,
            child: ProfileButton(
              function: () {
                userRole='Doctor';
                BlocProvider.of<SignOutCubit>(context).signOut();
              },
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

