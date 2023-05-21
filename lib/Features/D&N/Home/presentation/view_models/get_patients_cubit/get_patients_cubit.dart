import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/model/patient_model/patient_model.dart';
import '../../../data/repos/home_repo.dart';
import 'get_patients_state.dart';

class GetPatientsCubit extends Cubit<GetPatientsState> {
  GetPatientsCubit(this.homeRepo,)
      : super(GetPatientsInitial());
  final HomeRepo homeRepo;

  List<PatientModel> patientModel = [];

  Future<void> getDoctorPatients() async {
    emit(GetPatientsLoading());
    await homeRepo.getDoctorPatients().then((value) {
      value.fold((e) => emit(GetPatientsFailure(e.errMessage)), (stream) {
        stream.listen((event) {
          patientModel = [];
          for (var element in event.docs) {
            patientModel.add(PatientModel.fromJson(
                element as QueryDocumentSnapshot<Map<String, dynamic>>));
          }
          emit(GetDoctorPatientsSuccess(patientModel));
        }).onError((err) {
          print(err.toString());
        });
      });
    });
  }

  Future<void> getNursePatients() async {
    emit(GetPatientsLoading());
    await homeRepo.getNursePatients().then((value) {
      value.fold((e) => emit(GetPatientsFailure(e.errMessage)), (stream) {
        stream.listen((event) async {
          patientModel = [];
          for (var element in event.docs) {
            patientModel.add(PatientModel.fromJson(
                element as QueryDocumentSnapshot<Map<String, dynamic>>));
          }
          emit(GetNursePatientsSuccess(patientModel));
        }).onError((err) {
          print(err.toString());
        });
      });
    });
  }
}
