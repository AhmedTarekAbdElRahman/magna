
import '../../../../../Core/model/user_model/user_model.dart';

abstract class EditProfileState{}

class EditProfileInitial extends EditProfileState{}

class EditProfileLoading extends EditProfileState{}
class EditProfileSuccess extends EditProfileState{}
class EditProfileFailure extends EditProfileState{
  final String errMessage;
  EditProfileFailure(this.errMessage);
}