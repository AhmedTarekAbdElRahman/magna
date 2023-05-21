// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:magna/Core/utils/styles.dart';
// import 'package:magna/Core/widgets/custom_error_widget.dart';
// import 'package:magna/Features/Profile/presentation/view_models/get_user_cubit/get_user_cubit.dart';
// import 'package:magna/Features/Profile/presentation/view_models/get_user_cubit/get_user_state.dart';
// import 'package:magna/Features/Profile/presentation/views/widgets/profile_actions.dart';
// import '../../../../../Core/model/user_model/user_model.dart';
// import '../../../../../Core/widgets/custom_loading_indicator.dart';
//
// class UserInfoSection extends StatelessWidget {
//   const UserInfoSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetUserCubit, GetUserState>(
//       builder: (context, state) {
//         if (state is GetUserSuccess) {
//           final UserModel user = state.user;
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Center(
//                   child: CircleAvatar(
//                     radius: MediaQuery.of(context).size.height / 9.8,
//                     backgroundColor: Colors.transparent,
//                     child: ClipOval(
//                       child: CachedNetworkImage(
//                         imageUrl: user.image!,
//                         placeholder: (context, url) => Container(
//                           color: Colors.grey[300],
//                         ),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.error_outline),
//                         fit: BoxFit.cover,
//                         height: double.infinity,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 ProfileActions(user: user),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 // Row(
//                 //   children: [
//                 //     Text(
//                 //       'Name:',
//                 //       style: Styles.style24B,
//                 //     ),
//                 //     SizedBox(
//                 //       width: 10.w,
//                 //     ),
//                 //     Text(
//                 //       user.name!,
//                 //       style: TextStyle(
//                 //         fontSize: 20.sp,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 // Row(
//                 //   children: [
//                 //     Text(
//                 //       'Phone:',
//                 //       style: Styles.style24B,
//                 //     ),
//                 //     SizedBox(
//                 //       width: 10.w,
//                 //     ),
//                 //     Text(
//                 //       user.phone!,
//                 //       style: TextStyle(
//                 //         fontSize: 20.sp,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 // Row(
//                 //   children: [
//                 //     Text(
//                 //       'Email:',
//                 //       style: Styles.style24B,
//                 //     ),
//                 //     SizedBox(
//                 //       width: 10.w,
//                 //     ),
//                 //     Text(
//                 //       user.email!,
//                 //       style: TextStyle(
//                 //         fontSize: 20.sp,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 // Row(
//                 //   children: [
//                 //     Text(
//                 //       'Role:',
//                 //       style: Styles.style24B,
//                 //     ),
//                 //     SizedBox(
//                 //       width: 10.w,
//                 //     ),
//                 //     Text(
//                 //       user.role!,
//                 //       style: TextStyle(
//                 //         fontSize: 20.sp,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Name:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(text: user.name!, style: TextStyle(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.normal))
//                       ]),
//                 ),  SizedBox(height: 10.h,),RichText(
//                   text: TextSpan(
//                       text: 'Email:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(text: user.email!, style: TextStyle(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.normal))
//                       ]),
//                 ),  SizedBox(height: 10.h,),RichText(
//                   text: TextSpan(
//                       text: 'Phone:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(text: user.phone!, style: TextStyle(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.normal))
//                       ]),
//                 ),  SizedBox(height: 10.h,),RichText(
//                   text: TextSpan(
//                       text: 'Role:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(text: user.role!, style: TextStyle(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//               ],
//             ),
//           );
//         } else if (state is GetUserFailure) {
//           return CustomErrorWidget(errMessage: state.errMessage);
//         } else {
//           return const CustomLoadingIndicator();
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/styles.dart';
import '../../../../../../Core/model/user_model/user_model.dart';
import 'profile_actions.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          ProfileActions(user: userModel),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            title: Text('Name',style: Styles.style24BB),
            subtitle: Text(userModel.name!,style: Styles.style20),
          ),

          ListTile(
            title: Text('Email',style: Styles.style24BB),
            subtitle: Text(userModel.email!,style: Styles.style20),
          ),
          ListTile(
            title: Text('Phone',style: Styles.style24BB),
            subtitle: Text(userModel.phone!,style: Styles.style20),
          ),
          ListTile(
            title: Text('Role',style: Styles.style24BB),
            subtitle: Text(userModel.role!,style: Styles.style20),
          ),
          SizedBox(
            height:MediaQuery.of(context).size.height/2,
          ),

        ],
      ),
    );
  }
}
