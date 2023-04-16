import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/Search/presentation/view_models/search_cubit/search_state.dart';
import '../../../data/repos/search_repo.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  List<PatientModel> patientModel =[];
  List<PatientModel> searchModel =[];
  Future<void> search({required String searchKey}) async {
    emit(SearchLoading());
    searchRepo.search().then((value){
      value.fold((e) => emit(SearchFailure(e.errMessage)), (stream) {
        stream.listen((event) {
          patientModel=[];
          for (var element in event.docs) {
            patientModel.add(PatientModel.fromJson(element as QueryDocumentSnapshot<Map<String,dynamic>>));
          }
          searchModel=patientModel.where((patient) => patient.name!.toLowerCase().startsWith(searchKey)).toList();
          emit(SearchSuccess(searchModel));
        });
      });
    });

  }

}
