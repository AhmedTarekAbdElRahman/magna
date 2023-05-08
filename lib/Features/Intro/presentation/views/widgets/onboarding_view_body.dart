import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/app_routers.dart';
import 'package:magna/Features/Intro/data/model/onboarding_model.dart';
import 'package:magna/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../Core/utils/shared_preferences.dart';
import 'build_boarding_item.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  var boardControlling = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboarding1.jpeg',
      title: 'Heart Diseases',
      body: 'Range of conditions that affect the heart',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.jpeg',
      title: 'Machine Learning',
      body: 'Prediction of next scenario ',
    ),
    BoardingModel(
      image: 'assets/images/onboarding3.jpeg',
      title: 'Monitoring System',
      body: 'Monitoring the patients Remotely',
    ),
  ];
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value!){
        Navigator.of(context).pushReplacementNamed(Routes.kLoginView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: boardControlling,
          itemBuilder: (context, index) =>
              BuildBoardingItem(model: boarding[index]),
          itemCount: boarding.length,
          onPageChanged: (int index) {
            if (index == boarding.length - 1) {
              setState(() {
                isLast = true;
              });
              debugPrint('last index');
            } else {
              setState(() {
                isLast = false;
              });
              debugPrint('not last index');
            }
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: submit,
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(30.0.sp),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardControlling,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10.h,
                    expansionFactor: 4,
                    dotWidth: 10.w,
                    spacing: 5,
                    activeDotColor: kPrimaryColor,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardControlling.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
