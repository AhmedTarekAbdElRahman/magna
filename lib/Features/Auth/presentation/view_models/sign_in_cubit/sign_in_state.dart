abstract class SignInState{}

class SignInInitial extends SignInState{}

class SignInLoading extends SignInState{}
class SignInSuccess extends SignInState{
  final String uId;

  SignInSuccess(this.uId);
}
class SignInFailure extends SignInState{
  final String errMessage;
  SignInFailure(this.errMessage);
}
class GetUserRoleLoading extends SignInState{}
class GetUserRoleSuccess extends SignInState{
  final bool roleDoctor;

  GetUserRoleSuccess(this.roleDoctor);
}
class GetUserRoleFailure extends SignInState{
  final String errMessage;
  GetUserRoleFailure(this.errMessage);
}