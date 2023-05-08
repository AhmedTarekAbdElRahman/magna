import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/Add/data/repos/add_repo.dart';
import 'package:magna/constant.dart';
import '../../../../../Core/utils/functions/detect_chest_pain_type.dart';
import 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit(this.addRepo) : super(AddPatientInitial());
  final AddRepo addRepo;

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
    required String phone,
    required String description,
    required String age,
    required String cholesterol,
    required String fastingBloodSugar,
  }) async {
    emit(AddImageLoading());
    if (patientImage != null) {
      final result = await addRepo.uploadImage(patientImage: patientImage!);
      result.fold((e) => emit(AddImageFailure(e.errMessage)), (imageUrl) {
        emit(AddImageSuccess());
        addPatient(
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
      addPatient(
        image: defaultImage,
        phone: phone,
        name: name,
        description: description,
        age: age,
        cholesterol: cholesterol,
        fastingBloodSugar: fastingBloodSugar,
      );
    }
  }

  Future<void> addPatient({
    required String name,
    required String phone,
    required String description,
    required String age,
    required String cholesterol,
    required String fastingBloodSugar,
    required String image,
  }) async {
    emit(AddPatientLoading());
    await addRepo
        .addPatient(
            patientModel: PatientModel(
      name: name,
      phone: phone,
      description: description,
      gender: patientGender == 'Male' ? '1' : '0',
      age: age,
      chestPainType: detectChestPainType(chestPainType),
      cholesterol: cholesterol,
      exerciseAngina: exerciseAnginaState == 'Yes' ? '1' : '0',
      fastingBloodSugar: fastingBloodSugar,
      fastingBloodSugarML: int.parse(fastingBloodSugar) > 120 ? '1' : '0',
      image: image,
    ))
        .then((value) {
      value.fold(
        (e) => emit(AddPatientFailure(e.errMessage)),
        (r) => emit(AddPatientSuccess()),
      );
    });
  }
}
