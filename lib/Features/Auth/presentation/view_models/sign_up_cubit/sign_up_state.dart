abstract class SignUpState{}

class SignUpInitial extends SignUpState{}

class SignUpLoading extends SignUpState{}
class SignUpSuccess extends SignUpState{
  final String uId;

  SignUpSuccess(this.uId);
}
class SignUpFailure extends SignUpState{
  final String errMessage;
  SignUpFailure(this.errMessage);
}
class PostUserDataLoading extends SignUpState{}
class PostUserDataSuccess extends SignUpState{}
class PostUserDataFailure extends SignUpState{
  final String errMessage;
  PostUserDataFailure(this.errMessage);
}

class PostUserRoleLoading extends SignUpState{}
class PostUserRoleSuccess extends SignUpState{}
class PostUserRoleFailure extends SignUpState{
  final String errMessage;
  PostUserRoleFailure(this.errMessage);
}
