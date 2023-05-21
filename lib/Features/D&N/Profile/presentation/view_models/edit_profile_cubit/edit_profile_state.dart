abstract class EditProfileState{}

class EditProfileInitial extends EditProfileState{}

class EditProfileLoading extends EditProfileState{}
class EditProfileSuccess extends EditProfileState{}
class EditProfileFailure extends EditProfileState{
  final String errMessage;
  EditProfileFailure(this.errMessage);
}
class ProfileImagePickedSuccess extends EditProfileState{}
class ProfileImagePickedFailure extends EditProfileState{
  ProfileImagePickedFailure();
}
class EditProfileImageLoading extends EditProfileState{}
class EditProfileImageSuccess extends EditProfileState{}
class EditProfileImageFailure extends EditProfileState{
  final String errMessage;
  EditProfileImageFailure(this.errMessage);
}