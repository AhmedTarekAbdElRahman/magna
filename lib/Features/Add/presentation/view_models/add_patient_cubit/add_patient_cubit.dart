import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/Add/data/repos/add_repo.dart';
import 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit(this.addRepo) : super(AddPatientInitial());
  final AddRepo addRepo;

  Future<void> addPatient({
    required String name,
    required String phone,
    required String gender,
    required String description,
  }) async {
    emit(AddPatientLoading());
    await addRepo
        .addPatient(
            patientModel: PatientModel(
      name: name,
      phone: phone,
      description: description,
      gender: gender,
    ))
        .then((value) {
      value.fold(
        (e) => emit(AddPatientFailure(e.errMessage)),
        (r) => emit(AddPatientSuccess()),
      );
    });
  }
}
