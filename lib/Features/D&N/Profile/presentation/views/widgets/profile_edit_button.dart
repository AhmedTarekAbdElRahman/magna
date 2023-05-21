import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/model/user_model/user_model.dart';
import '../../../../../../Core/utils/app_routers.dart';
import '../../view_models/get_user_cubit/get_user_cubit.dart';
import 'profile_button.dart';

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ProfileButton(
        child: const Icon(Icons.edit),
        function: () {
          Navigator.of(context)
              .pushNamed(Routes.kProfileUpdateView, arguments: user)
              .then((value) {
            if (value == 'update') {
              BlocProvider.of<GetUserCubit>(context).getUser();
            }
          });
        },
      ),
    );
  }
}
