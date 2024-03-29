import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/profile_repo.dart';
import 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.profileRepo) : super(SignOutInitial());
  final ProfileRepo profileRepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    var result = await profileRepo.userSignOut();
    result.fold((e) {
      emit(SignOutFailure(e.errMessage));
    }, (r) {
      emit(SignOutSuccess());
    });
  }
}
