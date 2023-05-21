import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/utils/service_locator.dart';
import 'package:magna/Features/D&N/Search/presentation/views/widgets/doctor_search_view_body.dart';
import '../../data/repos/search_repo_imp.dart';
import '../view_models/search_cubit/search_cubit.dart';

class DoctorSearchView extends StatelessWidget {
  const DoctorSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getIt.get<SearchRepoImp>(),
      ),
      child: const SafeArea(child: DoctorSearchViewBody()),
    );
  }
}
