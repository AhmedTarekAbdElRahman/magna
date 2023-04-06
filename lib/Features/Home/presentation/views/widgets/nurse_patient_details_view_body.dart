import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';

class NursePatientDetailsViewBody extends StatelessWidget {
  const NursePatientDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(
          title: 'PatientDetails',
        ),
        SizedBox(
          height: 20.h,
        ),
        const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/patient.jpg',
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
              SizedBox(width: 10.w,),
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
              SizedBox(width: 10.w,),
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
                'Gender:',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                'Male',
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
                'Description:',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                't3baan',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
