import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_in_cubit/sign_in_state.dart';
import '../../../../../Core/model/user_model/user_model.dart';
import '../../../data/repos/auth_repo.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    await authRepo.userSignIn(
        userModel: UserModel(
      email: email,
      password: password,
    )).then((value) {
      value.fold((e) {
        emit(SignInFailure(e.errMessage));
      }, (user) async{
        emit(GetUserRoleLoading());
        await authRepo.getUserRole(uId: user.user!.uid).then((value){
          value.fold((e){
            emit(GetUserRoleFailure(e.errMessage));
          }, (userRole) {
            emit(GetUserRoleSuccess(userRole));
          });
        });
        emit(SignInSuccess(user.user!.uid));
      });
    });
  }
}
