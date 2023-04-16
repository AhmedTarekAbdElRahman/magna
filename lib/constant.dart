import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:magna/Features/Search/presentation/views/nurse_search_view.dart';
import 'Features/Home/presentation/views/doctor_home_view.dart';
import 'Features/Home/presentation/views/nurse_home_view.dart';
import 'Features/Profile/presentation/views/profile_view.dart';
import 'Features/Search/presentation/views/doctor_search_view.dart';
String uId='';
const kPrimaryColor = Colors.blue;
const List<String> roleList = <String>['Doctor', 'Nurse'];
String userRole='Doctor';
String patientGender='Male';
const List<String> gender = <String>['Male', 'Female'];
late String route;
String defaultImage='https://img.freepik.com/free-photo/enchanting-blinde-woman-trendy-knitted-sweater-expressing-happiness-indoor-portrait-charming-european-woman-standing-orange_197531-12473.jpg?t=st=1681308353~exp=1681308953~hmac=168fb363dfdf14c7a9b9323f3806672b4932ce6d10cc2a400444968aeddd8651';
List<BottomNavyBarItem> doctorBottomNavyBarItem=<BottomNavyBarItem>[
  BottomNavyBarItem(
    title: const Text('Home'),
    icon: const Icon(Icons.home_outlined),
  ),
  BottomNavyBarItem(
    title: const Text('Search'),
    icon: const Icon(Icons.search),
  ),
  BottomNavyBarItem(
    title: const Text('Add'),
    icon: const Icon(Icons.person_add_alt_outlined),
  ),
  BottomNavyBarItem(
    title: const Text('Profile'),
    icon: const Icon(Icons.account_circle_outlined),
  ),
];
List<Widget> doctorScreens=<Widget>[
  const DoctorHomeView(),
  const DoctorSearchView(),
  const SizedBox(),
  const ProfileView(),
];
List<BottomNavyBarItem> nurseBottomNavyBarItem=<BottomNavyBarItem>[
  BottomNavyBarItem(
    title: const Text('Home'),
    icon: const Icon(Icons.home_outlined),
  ),
  BottomNavyBarItem(
    title: const Text('Search'),
    icon: const Icon(Icons.search),
  ),
  BottomNavyBarItem(
    title: const Text('Profile'),
    icon: const Icon(Icons.account_circle_outlined),
  ),
];
List<Widget> nurseScreens=<Widget>[
  const NurseHomeView(),
  const NurseSearchView(),
  const ProfileView(),
];