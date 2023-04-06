
import '../../../../../Core/model/user_model/user_model.dart';

abstract class GetUserState{}

class GetUserInitial extends GetUserState{}

class GetUserLoading extends GetUserState{}
class GetUserSuccess extends GetUserState{
  final UserModel user;

  GetUserSuccess(this.user);
}
class GetUserFailure extends GetUserState{
  final String errMessage;
  GetUserFailure(this.errMessage);
}