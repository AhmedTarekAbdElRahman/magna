import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_up_cubit/sign_up_state.dart';
import '../../../../../Core/model/user_model/user_model.dart';
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
    await authRepo
        .userSignUp(
          userModel: UserModel(
            email: email,
            password: password,
          ),
        )
        .then(
          (value) => value.fold(
            (e) => emit(
              SignUpFailure(e.errMessage),
            ),
            (user) {
              postUserData(
                  uId: user.user!.uid,
                  name: name,
                  phone: phone,
                  role: role,
                  email: email);
              postUserRole(
                role: role,
                uId: user.user!.uid,
              );
              emit(
                SignUpSuccess(user.user!.uid),
              );
            },
          ),
        );
  }

  Future<void> postUserData({
    required String uId,
    required String name,
    required String phone,
    required String email,
    required String role,
  }) async {
    emit(PostUserDataLoading());
    final result = await authRepo.postUserData(
        userModel: UserModel(
      uId: uId,
      role: role,
      phone: phone,
      name: name,
      email: email,
    ));
    result.fold(
      (l) => emit(PostUserDataFailure(l.errMessage)),
      (r) => emit(PostUserDataSuccess()),
    );
  }

  Future<void> postUserRole({
    required String uId,
    required String role,
  }) async {
    emit(PostUserRoleLoading());
    final result = await authRepo.postUserRole(
        userModel: UserModel(
      uId: uId,
      role: role,
    ));
    result.fold(
      (l) => emit(PostUserRoleFailure(l.errMessage)),
      (r) => emit(PostUserRoleSuccess()),
    );
  }
}
