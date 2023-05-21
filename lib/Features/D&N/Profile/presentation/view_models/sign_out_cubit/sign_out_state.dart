abstract class SignOutState{}

class SignOutInitial extends SignOutState{}

class SignOutLoading extends SignOutState{}
class SignOutSuccess extends SignOutState{}
class SignOutFailure extends SignOutState{
  final String errMessage;
  SignOutFailure(this.errMessage);
}