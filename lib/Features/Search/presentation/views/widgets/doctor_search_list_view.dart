import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:magna/Features/Search/presentation/views/widgets/doctor_search_patient_list_view_item.dart';
import '../../../../../Core/widgets/custom_error_widget.dart';
import '../../../../Home/presentation/views/widgets/delete_item_button.dart';
import '../../../../Home/presentation/views/widgets/edit_item_button.dart';
import '../../view_models/search_cubit/search_cubit.dart';
import '../../view_models/search_cubit/search_state.dart';

class DoctorSearchListView extends StatelessWidget {
  const DoctorSearchListView({
    Key? key, required this.searchController,
  }) : super(key: key);
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.searchModel.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.25,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            EditItemButton(
                              patientModel: state.searchModel[index],
                            ),
                            DeleteItemButton(
                              patientId: state.searchModel[index].id!,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  child: DoctorSearchPatientsListViewItem(
                    patientModel: state.searchModel[index],
                    index: index, searchController: searchController,
                  ),
                );
              },
            ),
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Container();
        }
      },
    );
  }
}
