abstract class DeletePatientState{}

class DeletePatientInitial extends DeletePatientState{}

class DeletePatientLoading extends DeletePatientState{}
class DeletePatientSuccess extends DeletePatientState{}
class DeletePatientFailure extends DeletePatientState{
  final String errMessage;
  DeletePatientFailure(this.errMessage);
}