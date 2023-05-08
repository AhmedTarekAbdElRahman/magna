abstract class AddPatientState{}

class AddPatientInitial extends AddPatientState{}

class AddPatientLoading extends AddPatientState{}
class AddPatientSuccess extends AddPatientState{}
class AddPatientFailure extends AddPatientState{
  final String errMessage;
  AddPatientFailure(this.errMessage);
}
class AddImagePickedSuccess extends AddPatientState{}
class AddImagePickedFailure extends AddPatientState{
  AddImagePickedFailure();
}
class AddImageLoading extends AddPatientState{}
class AddImageSuccess extends AddPatientState{}
class AddImageFailure extends AddPatientState{
  final String errMessage;
  AddImageFailure(this.errMessage);
}
