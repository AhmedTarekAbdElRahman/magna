import 'package:magna/Core/model/patient_model/patient_model.dart';

abstract class GetPatientProfileState{}

class GetPatientProfileInitial extends GetPatientProfileState{}
class GetPatientProfileLoading extends GetPatientProfileState{}
class GetPatientProfileSuccess extends GetPatientProfileState{
  final PatientModel patientModel;

  GetPatientProfileSuccess(this.patientModel);
}
class GetPatientProfileFailure extends GetPatientProfileState{
  final String errMessage;
  GetPatientProfileFailure(this.errMessage);
}
