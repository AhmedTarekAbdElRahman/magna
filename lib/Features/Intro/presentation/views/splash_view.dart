import 'package:flutter/material.dart';
import 'package:magna/constant.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}
