
import '../../../../../../Core/model/patient_model/patient_model.dart';

abstract class GetPatientsState{}

class GetPatientsInitial extends GetPatientsState{}

class GetPatientsLoading extends GetPatientsState{}
class GetDoctorPatientsSuccess extends GetPatientsState{
  final List<PatientModel>patientModel;
  GetDoctorPatientsSuccess(this.patientModel);
}
class GetNursePatientsSuccess extends GetPatientsState{
  final List<PatientModel>patientModel;
  GetNursePatientsSuccess(this.patientModel);
}
class GetPatientsFailure extends GetPatientsState{
  final String errMessage;
  GetPatientsFailure(this.errMessage);
}