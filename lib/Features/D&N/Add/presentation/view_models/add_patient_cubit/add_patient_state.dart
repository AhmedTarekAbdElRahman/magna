abstract class AddPatientState{}

class AddPatientInitial extends AddPatientState{}
class CreatePatientLoading extends AddPatientState{}
class CreatePatientSuccess extends AddPatientState{
  final String uId;

  CreatePatientSuccess(this.uId);
}
class CreatePatientFailure extends AddPatientState{
  final String errMessage;
  CreatePatientFailure(this.errMessage);
}
class AddPatientLoading extends AddPatientState{}
class AddPatientSuccess extends AddPatientState{}
class AddPatientFailure extends AddPatientState{
  final String errMessage;
  AddPatientFailure(this.errMessage);
}
class AddImagePickedSuccess extends AddPatientState{}
class AddImagePickedFailure extends AddPatientState{}
class AddImageLoading extends AddPatientState{}
class AddImageSuccess extends AddPatientState{}
class AddImageFailure extends AddPatientState{
  final String errMessage;
  AddImageFailure(this.errMessage);
}
class PostPatientRoleLoading extends AddPatientState{}
class PostPatientRoleSuccess extends AddPatientState{}
class PostPatientRoleFailure extends AddPatientState{
  final String errMessage;
  PostPatientRoleFailure(this.errMessage);
}