import 'package:flutter/material.dart';

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
            child: const Text(
              'Heart Monitoring System',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
