import 'package:flutter/material.dart';
import 'package:magna/constant.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key,this.color=kPrimaryColor}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(color: color),
    );
  }
}
