
abstract class UploadLabResultState{}

class UploadLabResultInitial extends UploadLabResultState{}
class UploadLabResultLoading extends UploadLabResultState{}
class UploadLabResultSuccess extends UploadLabResultState{}
class UploadLabResultFailure extends UploadLabResultState{
  final String errMessage;
  UploadLabResultFailure(this.errMessage);
}
class UploadLabResultFirestoreLoading extends UploadLabResultState{}
class UploadLabResultFirestoreSuccess extends UploadLabResultState{}
class UploadLabResultFirestoreFailure extends UploadLabResultState{
  final String errMessage;
  UploadLabResultFirestoreFailure(this.errMessage);
}
class AddImagePickedSuccess extends UploadLabResultState{}
class AddImagePickedFailure extends UploadLabResultState{}
