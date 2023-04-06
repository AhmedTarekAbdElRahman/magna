import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/model/user_model/user_model.dart';
import '../../../../../constant.dart';
import '../../../data/repos/profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> editProfile(
      {
      required String name,
      required String phone}) async {
    await profileRepo
        .editUser(
            userModel: UserModel(
      uId: uId,
      name: name,
      phone: phone,
    ))
        .then((value) {
      value.fold((e) => emit(EditProfileFailure(e.errMessage)),
          (r) => emit(EditProfileSuccess()));
    });
  }



}
