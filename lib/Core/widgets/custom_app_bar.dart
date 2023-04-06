import 'package:flutter/material.dart';
import 'package:magna/Core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Styles.style24B,
      ),
    );
    //   Container(
    //   height: 56.0.h,
    //   color: kPrimaryColor,
    //   child: Align(
    //     alignment: Alignment.centerLeft,
    //     child: Text(
    //       title,
    //       style: Styles.style24B,
    //     ),
    //   ),
    // );
  }
}
