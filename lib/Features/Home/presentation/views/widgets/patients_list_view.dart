import 'package:flutter/material.dart';

import 'patients_list_view_item.dart';

class PatientsListView extends StatelessWidget {
  const PatientsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder:(context, index) {
          return const PatientsListViewItem();
        },
      ),
    );
  }
}
