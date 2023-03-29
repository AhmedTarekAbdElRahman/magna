import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/utils/app_routers.dart';

class PatientsListViewItem extends StatelessWidget {
  const PatientsListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 15.0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.of(context).pushNamed(Routes.kPatientDetailsView);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/patient.jpg',
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Ahmed Tarek',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Case',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//Padding(
//         padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 20.w),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                 blurRadius: 3.0,
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 80,
//                 width: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/patient.jpg'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 20.w,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10.0.h),
//                     child: Text(
//                       'Ahmed Tarek',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '22 years old',
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       )
//
