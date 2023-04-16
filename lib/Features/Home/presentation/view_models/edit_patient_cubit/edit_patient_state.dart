import '../../../../../Core/model/patient_model/patient_model.dart';

abstract class EditPatientState{}

class EditPatientInitial extends EditPatientState{}

class EditPatientLoading extends EditPatientState{}
class EditPatientSuccess extends EditPatientState{}
class EditPatientFailure extends EditPatientState{
  final String errMessage;
  EditPatientFailure(this.errMessage);
}