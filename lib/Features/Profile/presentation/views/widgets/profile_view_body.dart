import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Features/Profile/presentation/view_models/sign_out_cubit/sign_out_cubit.dart';
import 'package:magna/Features/Profile/presentation/view_models/sign_out_cubit/sign_out_state.dart';
import '../../../../../Core/utils/app_routers.dart';
import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_floating_action_button.dart';
import '../../../../../constant.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.h,
          color: kPrimaryColor,
          child: Row(
            children: [
              IconButton(
                iconSize: 40,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              Text(
                'Profile',
                style: Styles.appBarStyle,
              ),
              const Spacer(),
              const SignOutButton(),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ),
            radius: 70,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            children: [
              Text(
                'Name:',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Ahmed tarek',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            children: [
              Text(
                'Phone:',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                '01140379370',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            children: [
              Text(
                'Email:',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'ahmed@gmail.com',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            children: [
              Text(
                'Password:',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                '123456',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomFloatingActionButton(
                icon: Icons.edit,
                function: () {
                  Navigator.of(context).pushNamed(Routes.kProfileUpdateView);
                }),
          ),
        ),
      ],
    );
  }
}

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
              .pushNamedAndRemoveUntil(Routes.kLoginView, (route) => false);
        } else if (state is SignOutFailure) {
          showToast(text: state.errMessage, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is SignOutLoading) {
          return Container();
        } else {
          return IconButton(
            onPressed: () => BlocProvider.of<SignOutCubit>(context).signOut(),
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
