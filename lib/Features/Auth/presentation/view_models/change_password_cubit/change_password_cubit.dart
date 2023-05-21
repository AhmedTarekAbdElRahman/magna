import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/auth_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.authRepo) : super(ChangePasswordInitial());
  final AuthRepo authRepo;
  Future<void>changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result =authRepo.changePassword(email: email, oldPassword: oldPassword, newPassword: newPassword);
    result.then((value){
      value.fold((l) => emit(ChangePasswordFailure(l.errMessage)), (r) => emit(ChangePasswordSuccess()));
    });
  }
}
