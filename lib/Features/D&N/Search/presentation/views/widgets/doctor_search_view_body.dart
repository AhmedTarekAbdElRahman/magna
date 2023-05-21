import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'doctor_search_form_field.dart';
import 'doctor_search_list_view.dart';

class DoctorSearchViewBody extends StatelessWidget {
  const DoctorSearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        DoctorSearchFormField(searchController: searchController),
        DoctorSearchListView(searchController: searchController),
      ],
    );
  }
}

