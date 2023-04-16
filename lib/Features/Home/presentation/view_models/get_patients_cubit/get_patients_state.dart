import '../../../../../Core/model/patient_model/patient_model.dart';

abstract class GetPatientsState{}

class GetPatientsInitial extends GetPatientsState{}

class GetPatientsLoading extends GetPatientsState{}
class GetPatientsSuccess extends GetPatientsState{
  final List<PatientModel>patientModel;
  GetPatientsSuccess(this.patientModel);
}
class GetPatientsFailure extends GetPatientsState{
  final String errMessage;
  GetPatientsFailure(this.errMessage);
}