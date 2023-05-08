abstract class EditPatientState{}

class EditPatientInitial extends EditPatientState{}

class EditPatientLoading extends EditPatientState{}
class EditPatientSuccess extends EditPatientState{}
class EditPatientFailure extends EditPatientState{
  final String errMessage;
  EditPatientFailure(this.errMessage);
}
class PatientImagePickedSuccess extends EditPatientState{}
class PatientImagePickedFailure extends EditPatientState{
  PatientImagePickedFailure();
}
class EditPatientImageLoading extends EditPatientState{}
class EditPatientImageSuccess extends EditPatientState{}
class EditPatientImageFailure extends EditPatientState{
  final String errMessage;
  EditPatientImageFailure(this.errMessage);
}