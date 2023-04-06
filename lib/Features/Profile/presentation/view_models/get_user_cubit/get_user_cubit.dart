import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/profile_repo.dart';
import 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.profileRepo) : super(GetUserInitial());
  final ProfileRepo profileRepo;

  Future<void> getUser() async {
    emit(GetUserLoading());
    await profileRepo.getUser().then((value) {
      value.fold((e) {
        emit(GetUserFailure(e.errMessage));
      }, (user) {
        emit(GetUserSuccess(user));
      });
    });

  }
  // late UserModel userModel;
  // Future<void> getUser()async{
  //   emit(GetUserLoading());
  //    profileRepo.getUser().then((event) {
  //      event.fold((e) {
  //            emit(GetUserFailure(e.errMessage));
  //          }, (user) {
  //            emit(GetUserSuccess(user));
  //          });
  //   });
  //}

}
