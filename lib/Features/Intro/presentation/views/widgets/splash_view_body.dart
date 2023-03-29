import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Features/Intro/presentation/views/widgets/sliding_text.dart';
import '../../../../../Core/utils/app_routers.dart';
import '../../../../../Core/utils/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Magna',
          style: TextStyle(
            fontSize: 30.0.sp,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SlidingWidget(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }
  bool? onBoarding=CacheHelper.getData(key: 'onBoarding');

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      if(onBoarding!=null){
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            print('user SignOut');
            Navigator.of(context).pushReplacementNamed(Routes.kLoginView);
          }
          else {
            print('user SignIn');
            Navigator.of(context).pushReplacementNamed(Routes.kHomeView);
          }
        });

      }else {
        Navigator.of(context).pushReplacementNamed(Routes.kOnboardingView);
      }
    });
  }
}
