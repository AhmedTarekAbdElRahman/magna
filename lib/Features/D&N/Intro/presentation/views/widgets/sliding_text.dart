import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidingWidget extends StatelessWidget {
  const SlidingWidget({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'Magna',
              style: TextStyle(
                fontSize: 30.0.sp,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}