import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Features/Auth/data/model/user_model/user_model.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_up_cubit/sign_up_state.dart';
import '../../../data/repos/auth_repo.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String role,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.userSignUp(
        userModel: UserModel(
      name: name,
      phone: phone,
      role: role,
      email: email,
      password: password,
    ));
    result.fold((e) {
      emit(SignUpFailure(e.errMessage));
    }, (r) {
      emit(SignUpSuccess());
    });
  }
}
