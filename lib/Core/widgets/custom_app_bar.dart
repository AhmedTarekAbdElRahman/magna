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
      actions: [
        Image.asset('assets/images/MAGNA.jpg')
      ],
    );
  }
}
