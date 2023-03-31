import 'package:flutter/material.dart';
import 'Core/utils/app_routers.dart';
import 'Core/utils/shared_preferences.dart';
String? uId=CacheHelper.getData(key: 'uId');
const kPrimaryColor = Colors.lightBlueAccent;
const List<String> role = <String>['Doctor', 'Nurse'];
const List<String> gender = <String>['Male', 'Female'];
String route=Routes.kOnboardingView;
