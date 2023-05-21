import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key, required this.function, required this.child,
  }) : super(key: key);
  final VoidCallback function;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: child,
    );
  }
}
