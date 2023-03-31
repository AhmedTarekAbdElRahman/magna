abstract class SignUpState{}

class SignUpInitial extends SignUpState{}

class SignUpLoading extends SignUpState{}
class SignUpSuccess extends SignUpState{
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