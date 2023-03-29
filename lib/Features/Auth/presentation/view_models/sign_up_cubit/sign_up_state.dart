abstract class SignUpState{}

class SignUpInitial extends SignUpState{}

class SignUpLoading extends SignUpState{}
class SignUpSuccess extends SignUpState{}
class SignUpFailure extends SignUpState{
  final String errMessage;
  SignUpFailure(this.errMessage);
}