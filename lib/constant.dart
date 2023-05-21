import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Features/D&N/Home/presentation/views/doctor_home_view.dart';
import 'Features/D&N/Home/presentation/views/nurse_home_view.dart';
import 'Features/D&N/Profile/presentation/views/profile_view.dart';
import 'Features/D&N/Search/presentation/views/doctor_search_view.dart';
import 'Features/D&N/Search/presentation/views/nurse_search_view.dart';
String? uId;
String? doctorName;
String? role;
const kPrimaryColor = Colors.blue;
String userRole='Doctor';
const List<String> roleList = <String>['Doctor', 'Nurse'];
String patientGender='Male';
const List<String> gender = <String>['Male', 'Female'];
String chestPainType='Typical Angina';
const List<String> chestPainTypes = <String>['Typical Angina', 'Atypical Angina','Non-Angina Pain', 'Asymptomatic'];
String exerciseAnginaState='Yes';
const List<String> exerciseAngina = <String>['Yes','No'];

late String route;
String defaultImage='https://invisiblechildren.com/wp-content/uploads/2012/07/facebook-profile-picture-no-pic-avatar.jpg';
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

final CollectionReference users =
FirebaseFirestore.instance.collection('users');
final CollectionReference patients =
FirebaseFirestore.instance.collection('patients');
final CollectionReference roles =
FirebaseFirestore.instance.collection('roles');