import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Features/Intro/data/model/onboarding_model.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({Key? key, required this.model}) : super(key: key);
  final BoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(model.image),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: 30.0.w,
              left: 30.0.w,
              bottom: MediaQuery.of(context).size.height / 4),
          child: Column(
            children: [
              const Spacer(),
              Text(
                model.title,
                style: TextStyle(fontSize: 24.0.sp, color: Colors.white),
              ),
              Text(
                model.body,
                style: TextStyle(fontSize: 14.0.sp, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
