import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Features/Search/presentation/views/widgets/search_form_field.dart';
import 'package:magna/Features/Search/presentation/views/widgets/doctor_search_list_view.dart';

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
        SearchFormField(searchController: searchController),
        const NurseSearchListView(),
      ],
    );
  }
}

