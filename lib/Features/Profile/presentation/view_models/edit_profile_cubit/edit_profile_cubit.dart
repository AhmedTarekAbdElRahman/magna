import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magna/Core/model/user_model/user_model.dart';
import '../../../../../constant.dart';
import '../../../data/repos/profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());
  final ProfileRepo profileRepo;
  var picker = ImagePicker();
  File? profileImage;

  Future<void> getProfileImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccess());
    } else {
      emit(ProfileImagePickedFailure());
    }
  }

  Future<void> uploadProfileImage({
    required String name,
    required String image,
    required String phone,
  }) async {
    emit(EditProfileImageLoading());
    if (profileImage != null) {
      final result = await profileRepo.uploadImage(profileImage: profileImage!);
      result.fold((e) => emit(EditProfileImageFailure(e.errMessage)),
            (imageUrl) {
          emit(EditProfileImageSuccess());
          editProfile(
            image: imageUrl.isEmpty ? image : imageUrl,
            phone: phone,
            name: name,
          );
        });
    } else {
      editProfile(
        image: image,
        phone: phone,
        name: name,
      );
    }
  }

  // void uploadProfileImage({
  //   required String name,
  //   required String image,
  //   required String phone,
  // }) {
  //   emit(EditProfileImageLoading());
  //   if (profileImage != null) {
  //     firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
  //         .putFile(profileImage!)
  //         .then((value) {
  //       value.ref.getDownloadURL().then((value) {
  //         emit(EditProfileImageSuccess());
  //         editProfile(
  //           image: value.isEmpty ? image : value,
  //           phone: phone,
  //           name: name,
  //         );
  //       }).catchError((errMessage) {
  //         emit(EditProfileImageFailure(errMessage));
  //       });
  //     }).catchError((errMessage) {
  //       emit(EditProfileImageFailure(errMessage));
  //     });
  //   } else {
  //     editProfile(
  //       image: image,
  //       phone: phone,
  //       name: name,
  //     );
  //   }
  // }

  Future<void> editProfile(
      {required String name,
      required String image,
      required String phone}) async {
    await profileRepo
        .editUser(
            userModel: UserModel(
      uId: uId,
      name: name,
      phone: phone,
      image: image,
    ))
        .then((value) {
      value.fold((e) => emit(EditProfileFailure(e.errMessage)),
          (r) => emit(EditProfileSuccess()));
    });
  }
}
