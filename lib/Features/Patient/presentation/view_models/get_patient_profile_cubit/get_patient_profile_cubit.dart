import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magna/Core/api_service/api_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../data/repos/patient_repo.dart';
import 'get_patient_profile_state.dart';

class GetPatientProfileCubit extends Cubit<GetPatientProfileState> {
  GetPatientProfileCubit(this.patientRepo, this.apiService) : super(GetPatientProfileInitial());
  final PatientRepo patientRepo;
final ApiService apiService;
  Future<void> getPatientProfile({required String pId}) async {
    emit(GetPatientProfileLoading());
    await patientRepo.getPatientProfile(pId: pId).then((value) {
      value.fold((e) => emit(GetPatientProfileFailure(e.errMessage)), (stream) {
        stream.listen((event) async{
          PatientModel patientModel=PatientModel.fromJson(event as DocumentSnapshot<Map<String, dynamic>> );
          if (patientModel.prediction == 'heart at risk') {
            await apiService.postData(data: {
              'to': '/topics/${patientModel.doctorId}',
              'notification': {
                "title": patientModel.name,
                "body": "His heart at risk",
                "sound": "default"
              },
              'data':patientModel.notificationMap()
            });
            if (patientModel.atHome! ==false) {
              await apiService.postData(
                data: {
                  'to': '/topics/N',
                  'notification': {
                    "title":patientModel.name,
                    "body": "His heart at risk",
                    "sound": "default"
                  },
                  'data':patientModel.notificationMap()
                },
              );
            }
          }
          emit(GetPatientProfileSuccess(patientModel));
        }).onError((err) {
          print(err.toString());
        });
      });
    });
  }
}
