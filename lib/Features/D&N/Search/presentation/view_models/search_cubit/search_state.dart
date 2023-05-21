
import '../../../../../../Core/model/patient_model/patient_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<PatientModel> searchModel;

  SearchSuccess(this.searchModel);
}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}
