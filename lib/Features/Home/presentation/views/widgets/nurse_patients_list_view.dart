import 'package:flutter/material.dart';

import 'doctor_patients_list_view_item.dart';
import 'nurse_patients_list_view_item.dart';

class NursePatientsListView extends StatelessWidget {
  const NursePatientsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder:(context, index) {
          return const NursePatientsListViewItem();
        },
      ),
    );
  }
}
