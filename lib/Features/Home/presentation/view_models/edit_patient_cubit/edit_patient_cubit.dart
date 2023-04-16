import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../data/repos/home_repo.dart';
import 'edit_patient_state.dart';

class EditPatientCubit extends Cubit<EditPatientState> {
  EditPatientCubit(this.homeRepo) : super(EditPatientInitial());
  final HomeRepo homeRepo;

  Future<void> editPatient({
    required String id,
    required String name,
    required String phone,
    required String description,
  }) async {
    emit(EditPatientLoading());
    final result = await homeRepo.editPatient(
        patientModel: PatientModel(
      id: id,
      name: name,
      description: description,
      phone: phone,
    ));
    result.fold(
      (e) => emit(EditPatientFailure(e.errMessage)),
      (r) => emit(EditPatientSuccess()),
    );
  }
}
