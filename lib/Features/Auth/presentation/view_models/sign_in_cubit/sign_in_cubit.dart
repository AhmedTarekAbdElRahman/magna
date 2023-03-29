import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Features/Auth/data/model/user_model/user_model.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_in_cubit/sign_in_state.dart';
import '../../../data/repos/auth_repo.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    var result = await authRepo.userSignIn(
        userModel: UserModel(
      email: email,
      password: password,
    ));
    result.fold((e) {
      emit(SignInFailure(e.errMessage));
    }, (r) {
      emit(SignInSuccess());
    });
  }
}
