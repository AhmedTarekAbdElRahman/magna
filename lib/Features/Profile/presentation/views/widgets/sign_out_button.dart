import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/app_routers.dart';
import '../../../../../Core/utils/functions/custom_toast.dart';
import '../../../../../Core/utils/shared_preferences.dart';
import '../../view_models/sign_out_cubit/sign_out_cubit.dart';
import '../../view_models/sign_out_cubit/sign_out_state.dart';

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
          return Container();
        } else {
          return IconButton(
            onPressed: () {
              CacheHelper.removeData(key: 'uId').then(
                    (value) => BlocProvider.of<SignOutCubit>(context).signOut(),
              );
            },
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
