import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../../Core/utils/functions/detect_chest_pain_type.dart';
import '../../../../../constant.dart';
import '../../../data/repos/home_repo.dart';
import 'edit_patient_state.dart';

class EditPatientCubit extends Cubit<EditPatientState> {
  EditPatientCubit(this.homeRepo) : super(EditPatientInitial());
  final HomeRepo homeRepo;
  var picker = ImagePicker();
  File? patientImage;

  Future<void> getPatientImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      patientImage = File(pickedFile.path);
      emit(PatientImagePickedSuccess());
    } else {
      emit(PatientImagePickedFailure());
    }
  }

  Future<void> uploadPatientImage({
    required String id,
    required String name,
    required String phone,
    required String description,
    required String age,
    required String cholesterol,
    required String fastingBloodSugar,
    required String image
  }) async {
    emit(EditPatientImageLoading());
    if (patientImage != null) {
      final result = await homeRepo.uploadImage(patientImage: patientImage!);
      result.fold((e) => emit(EditPatientImageFailure(e.errMessage)),
              (imageUrl) {
            emit(EditPatientImageSuccess());
            editPatient(
              image: imageUrl.isEmpty ? image : imageUrl,
              phone: phone,
              name: name,
              id: id,
              description: description,
              age: age,
              cholesterol: cholesterol,
              fastingBloodSugar: fastingBloodSugar,
            );
          });
    } else {
      editPatient(
        image: image,
        phone: phone,
        name: name,
        id: id,
        description: description,
        age: age,
        cholesterol: cholesterol,
        fastingBloodSugar: fastingBloodSugar,
      );
    }
  }



  Future<void> editPatient({
    required String id,
    required String name,
    required String phone,
    required String description,
    required String age,
    required String cholesterol,
    required String fastingBloodSugar,
    required String image
  }) async {
    emit(EditPatientLoading());
    final result = await homeRepo.editPatient(
        patientModel: PatientModel(
      id: id,
      name: name,
      description: description,
      phone: phone,
      image: image,
      age: age,
      chestPainType: detectChestPainType(chestPainType),
      cholesterol: cholesterol,
      exerciseAngina: exerciseAnginaState == 'Yes' ? '1' : '0',
      fastingBloodSugar: fastingBloodSugar,
    ));
    result.fold(
      (e) => emit(EditPatientFailure(e.errMessage)),
      (r) => emit(EditPatientSuccess()),
    );
  }
}
