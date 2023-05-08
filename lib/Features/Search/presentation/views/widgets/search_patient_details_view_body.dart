// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:magna/Core/model/patient_model/patient_model.dart';
// import '../../../../../Core/utils/functions/detect_chest_pain_type.dart';
// import '../../../../../Core/utils/styles.dart';
// import '../../../../../Core/widgets/custom_app_bar.dart';
//
// class PatientDetailsViewBody extends StatelessWidget {
//   const PatientDetailsViewBody({Key? key, required this.patientModel})
//       : super(key: key);
//   final PatientModel patientModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const CustomAppBar(
//             title: 'Patient Details',
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Hero(
//             tag: patientModel.id!,
//             child: Center(
//               child: CircleAvatar(
//                 radius: MediaQuery.of(context).size.height / 9.8,
//                 backgroundColor: Colors.transparent,
//                 child: ClipOval(
//                   child: CachedNetworkImage(
//                     imageUrl: patientModel.image!,
//                     placeholder: (context, url) => Container(
//                       color: Colors.grey[300],
//                     ),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error_outline),
//                     fit: BoxFit.cover,
//                     height: double.infinity,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Padding(
// //   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
// //   child: Row(
// //     children: [
// //       Text(
// //         'Name:',
// //         style: TextStyle(
// //           fontSize: 24.sp,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       SizedBox(
// //         width: 10.w,
// //       ),
// //       Text(
// //         patientModel.name!,
// //         style: TextStyle(
// //           fontSize: 20.sp,
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
// // Padding(
// //   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
// //   child: Row(
// //     children: [
// //       Text(
// //         'Phone:',
// //         style: TextStyle(
// //           fontSize: 24.sp,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       SizedBox(
// //         width: 10.w,
// //       ),
// //       Text(
// //         patientModel.phone!,
// //         style: TextStyle(
// //           fontSize: 20.sp,
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
// // Padding(
// //   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
// //   child: Row(
// //     children: [
// //       Text(
// //         'Gender:',
// //         style: TextStyle(
// //           fontSize: 24.sp,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       SizedBox(
// //         width: 10.w,
// //       ),
// //       Expanded(
// //         child: Text(
// //           patientModel.gender!,
// //           style: TextStyle(
// //             fontSize: 20.sp,
// //           ),
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
// // Padding(
// //   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
// //   child: Row(
// //     children: [
// //       Text(
// //         'Description:',
// //         style: TextStyle(
// //           fontSize: 24.sp,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       SizedBox(
// //         width: 10.w,
// //       ),
// //       Expanded(
// //         child: Text(
// //           patientModel.description!,
// //           style: TextStyle(
// //             fontSize: 20.sp,
// //           ),
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Name:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.name!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Phone:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.phone!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Gender:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.gender! =='1'?'Male':'Female',
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Description:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.description!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Age:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.age!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Chest pain type:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: detectChestPainType(patientModel.chestPainType!),
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Cholesterol:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.cholesterol!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Exercise angina:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.exerciseAngina! =='0'?'No':'Yes',
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Fasting blood sugar:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.fastingBloodSugar!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'ECG:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.ecg!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'Max heart rate:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.maxHeartRate!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: 'prediction:  ',
//                       style: Styles.style24BB,
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: patientModel.prediction!,
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal))
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/Home/presentation/views/widgets/patient_info_section.dart';
import 'package:magna/Features/Search/presentation/views/widgets/search_patient_info_section.dart';
import '../../../../../Core/widgets/custom_sliver_app_bar.dart';

class SearchPatientDetailsViewBody extends StatelessWidget {
  const SearchPatientDetailsViewBody({Key? key, required this.patientModel, required this.index})
      : super(key: key);
  final PatientModel patientModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          text: 'Patient Details',
          image:patientModel.image!,
          id: patientModel.id!,
        ),
        SliverList(delegate: SliverChildListDelegate([
          SearchPatientInfoSection(patientModel: patientModel,index: index,),
        ]))
      ],
    );
  }
}



