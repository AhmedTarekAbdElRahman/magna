import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/app_routers.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/constant.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 60.h,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Routes.kProfileView);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/profile.png',
                  ),
                  radius: 18,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Patients',
              style: Styles.appBarStyle,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
