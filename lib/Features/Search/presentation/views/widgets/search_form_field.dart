import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/custom_form_field.dart';
import '../../view_models/search_cubit/search_cubit.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: searchController,
      label: 'Search',
      prefix: Icons.search,
      validate: (String? value) {
        return null;
      },
      type: TextInputType.name,
      autofocus: true,
      onChange: (value) => BlocProvider.of<SearchCubit>(context)
          .search(searchKey: searchController.text),
    );
  }
}
