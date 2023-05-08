// import 'package:flutter/material.dart';
// import '../../../../Core/widgets/custom_app_bar.dart';
// import 'widgets/user_info_section.dart';
//
// class ProfileView extends StatelessWidget {
//   const ProfileView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: const [
//         CustomAppBar(title: 'Profile'),
//         UserInfoSection(),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/widgets/custom_sliver_app_bar.dart';
import 'package:magna/Features/Profile/presentation/view_models/get_user_cubit/get_user_cubit.dart';
import 'package:magna/Features/Profile/presentation/view_models/get_user_cubit/get_user_state.dart';
import '../../../../Core/widgets/custom_error_widget.dart';
import '../../../../Core/widgets/custom_loading_indicator.dart';
import 'widgets/user_info_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit, GetUserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(text: 'Profile', image: state.user.image!,id: state.user.uId!),
              SliverList(
                  delegate: SliverChildListDelegate([
                UserInfoSection(userModel: state.user),

              ]))
            ],
          );
        } else if (state is GetUserFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
