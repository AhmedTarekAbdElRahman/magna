import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title,
            style: Styles.appBarStyle,
          )
        ],
      ),
    );
  }
}
