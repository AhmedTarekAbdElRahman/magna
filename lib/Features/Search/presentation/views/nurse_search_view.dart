import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/utils/service_locator.dart';
import 'package:magna/Features/Search/data/repos/search_repo_imp.dart';
import 'package:magna/Features/Search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:magna/Features/Search/presentation/views/widgets/nurse_search_view_body.dart';

class NurseSearchView extends StatelessWidget {
  const NurseSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getIt.get<SearchRepoImp>(),
      ),
      child: const SafeArea(child: NurseSearchViewBody()),
    );
  }
}
