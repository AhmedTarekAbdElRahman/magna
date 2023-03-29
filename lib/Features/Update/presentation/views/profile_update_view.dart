import 'package:flutter/material.dart';
import 'package:magna/Features/Update/presentation/views/widgets/update_profile_view_body.dart';

class ProfileUpdateView extends StatelessWidget {
  const ProfileUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileUpdateViewBody()),
    );
  }
}
