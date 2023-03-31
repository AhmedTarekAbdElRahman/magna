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
            (user) async {
              emit(PostUserDataLoading());
              await authRepo
                  .postUserData(
                    userModel: UserModel(
                      uId: user.user!.uid,
                      name: name,
                      phone: phone,
                      email: email,
                      password: password,
                      role: role,
                    ),
                  )
                  .then(
                    (value) => value.fold(
                      (e) => emit(
                        PostUserDataFailure(e.errMessage),
                      ),
                      (r) => PostUserDataSuccess(),
                    ),
                  );
              emit(SignUpSuccess());
            },
          ),
        );
  }
}

// Future<void> postUserData({
//   required String uId,
//   required String name,
//   required String phone,
//   required String email,
//   required String password,
//   required String role,
// }) async {
//   final result = await authRepo.postUserData(
//       userModel: UserModel(
//     image:
//         'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=996&t=st=1680120982~exp=1680121582~hmac=373beb9727cd2384030f0ac9b5010ee0d3b7b2bc20b471a5bb2601a8e30ad99d',
//     uId: uId,
//     role: role,
//     phone: phone,
//     name: name,
//     password: password,
//     email: email,
//   ));
//   result.fold(
//     (l) => emit(PostUserDataFailure(l.errMessage)),
//     (r) => emit(PostUserDataSuccess()),
//   );
// }
