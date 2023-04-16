import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Features/Home/data/repos/home_repo.dart';
import '../../../../../Core/model/patient_model/patient_model.dart';
import 'get_patients_state.dart';

class GetPatientsCubit extends Cubit<GetPatientsState> {
  GetPatientsCubit(this.homeRepo) : super(GetPatientsInitial());
  final HomeRepo homeRepo;
  List<PatientModel>patientModel = [];

  Future<void> getPatients() async{
    // FirebaseFirestore.instance
    //     .collection('patients')
    //     .snapshots()
    //     .listen((event) {
    //      patientModel=[];
    //   for (var element in event.docs) {
    //     patientModel.add(PatientModel.fromJson(element));
    //     print(element.data()['name']);
    //   }
    //   emit(GetPatientsSuccess(patientModel));
    // });
    emit(GetPatientsLoading());
    homeRepo.getPatients().then((value){
      value.fold((e) => emit(GetPatientsFailure(e.errMessage)), (stream) {
        stream.listen((event) {
          patientModel=[];
            for (var element in event.docs) {
              patientModel.add(PatientModel.fromJson(element as QueryDocumentSnapshot<Map<String,dynamic>>));
            }
            emit(GetPatientsSuccess(patientModel));
        });
      });
    });

  }
}
