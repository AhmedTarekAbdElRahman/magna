import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/constant.dart';
import '../../../../../../Core/model/user_model/user_model.dart';
import '../../../../../../Core/utils/functions/detect_chest_pain_type.dart';
import '../../../../../Auth/data/repos/auth_repo.dart';
import '../../../data/repos/add_repo.dart';
import 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit(this.addRepo, this.authRepo)
      : super(AddPatientInitial());
  final AddRepo addRepo;
  final AuthRepo authRepo;
  var picker = ImagePicker();
  File? patientImage;

  Future<void> getProfileImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      patientImage = File(pickedFile.path);
      emit(AddImagePickedSuccess());
    } else {
      emit(AddImagePickedFailure());
    }
  }

  Future<void> uploadPatientImage({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String description,
    required String age,
    required String cholesterol,
    required String fastingBloodSugar,
    required String doctorName,
  }) async {
    emit(AddImageLoading());
    if (patientImage != null) {
      final result = await addRepo.uploadImage(patientImage: patientImage!);
      result.fold((e) => emit(AddImageFailure(e.errMessage)), (imageUrl) {
        emit(AddImageSuccess());
        createPatient(
          doctorName: doctorName,
          password: password,
          email: email,
          image: imageUrl.isEmpty ? defaultImage : imageUrl,
          phone: phone,
          name: name,
          description: description,
          age: age,
          cholesterol: cholesterol,
          fastingBloodSugar: fastingBloodSugar,
        );
      });
    } else {
      createPatient(
        doctorName: doctorName,
        email: email,
        image: defaultImage,
        phone: phone,
        name: name,
        description: description,
        age: age,
        cholesterol: cholesterol,
        fastingBloodSugar: fastingBloodSugar,
        password: password,
      );
    }
  }

  Future<void> createPatient({
    required String name,
    required String phone,
    required String email,
    required String description,
    required String age,
    required String cholesterol,
    required String fastingBloodSugar,
    required String image,
    required String password,
    required String doctorName,
  }) async {
    emit(CreatePatientLoading());
    await authRepo
        .userSignUp(
      userModel: UserModel(
        email: email,
        password: password,
      ),
    )
        .then((value) {
      value.fold((l) => emit(CreatePatientFailure(l.errMessage)), (user) {
        emit(CreatePatientSuccess(user.user!.uid));
        postPatientRole(uId: user.user!.uid);
        addPatient(
          doctorName: doctorName,
          id: user.user!.uid,
          email: email,
          image: defaultImage,
          phone: phone,
          name: name,
          description: description,
          age: age,
          cholesterol: cholesterol,
          fastingBloodSugar: fastingBloodSugar,
        );
      });
    });
  }

  Future<void> addPatient({
    required String id,
    required String name,
    required String phone,
    required String email,
    required String description,
    required String age,
    required String cholesterol,
    required String fastingBloodSugar,
    required String image,
    required String doctorName,
  }) async {
    emit(AddPatientLoading());
    await addRepo
        .addPatient(
            patientModel: PatientModel(
      id: id,
      doctorName: doctorName,
      name: name,
      phone: phone,
      email: email,
      description: description,
      gender: patientGender,
      age: age,
      chestPainType: chestPainType,
      cholesterol: cholesterol,
      exerciseAngina: exerciseAnginaState,
      fastingBloodSugar: fastingBloodSugar,
      image: image,
    ))
        .then((value) {
      value.fold(
        (e) => emit(AddPatientFailure(e.errMessage)),
        (r)  {
          emit(AddPatientSuccess());
        },
      );
    });
  }

  Future<void> postPatientRole({
    required String uId,
  }) async {
    emit(PostPatientRoleLoading());
    final result = await authRepo.postUserRole(
        userModel: UserModel(
      uId: uId,
      role: 'Patient',
    ));
    result.fold(
      (l) => emit(PostPatientRoleFailure(l.errMessage)),
      (r) => emit(PostPatientRoleSuccess()),
    );
  }
}
