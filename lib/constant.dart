import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'Features/Home/presentation/views/doctor_home_view.dart';
import 'Features/Home/presentation/views/nurse_home_view.dart';
import 'Features/Profile/presentation/views/profile_view.dart';
import 'Features/Search/presentation/views/search_view.dart';
String uId='';
const kPrimaryColor = Colors.blue;
const List<String> roleList = <String>['Doctor', 'Nurse'];
String userRole='Doctor';
const List<String> gender = <String>['Male', 'Female'];
late String route;
String defaultImage='https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=996&t=st=1680120982~exp=1680121582~hmac=373beb9727cd2384030f0ac9b5010ee0d3b7b2bc20b471a5bb2601a8e30ad99d';
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
  const SearchView(),
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
  const SearchView(),
  const ProfileView(),
];