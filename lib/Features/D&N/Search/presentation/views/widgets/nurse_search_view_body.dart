import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nurse_search_form_field.dart';
import 'nurse_search_list_view.dart';

class NurseSearchViewBody extends StatelessWidget {
  const NurseSearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        NurseSearchFormField(searchController: searchController),
        NurseSearchListView(searchController: searchController),
      ],
    );
  }
}

