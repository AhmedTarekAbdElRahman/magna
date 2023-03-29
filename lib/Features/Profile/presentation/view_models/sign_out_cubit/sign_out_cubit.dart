import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Features/Profile/presentation/view_models/sign_out_cubit/sign_out_state.dart';
import '../../../data/repos/profile_repo.dart';

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
