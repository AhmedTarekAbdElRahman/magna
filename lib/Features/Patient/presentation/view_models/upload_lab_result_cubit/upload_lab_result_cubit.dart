import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magna/Core/api_service/api_service.dart';
import '../../../../../Core/model/patient_model/patient_model.dart';
import '../../../data/repos/patient_repo.dart';
import 'upload_lab_result_state.dart';

class UploadLabResultCubit extends Cubit<UploadLabResultState> {
  UploadLabResultCubit(this.patientRepo, this.apiService)
      : super(UploadLabResultInitial());
  final PatientRepo patientRepo;
  final ApiService apiService;
  var picker = ImagePicker();
  File? patientImage;

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      patientImage = File(pickedFile.path);
      emit(AddImagePickedSuccess());
    } else {
      emit(AddImagePickedFailure());
    }
  }

  Future<void> uploadLabResult({required PatientModel patientModel}) async {
    emit(UploadLabResultLoading());
    await patientRepo
        .uploadLabResultStorage(patientImage: patientImage!)
        .then((value) {
      value.fold((l) => emit(UploadLabResultFailure(l.errMessage)),
          (imageUrl) async {
        emit(UploadLabResultLoading());
        patientModel.labResults = imageUrl;
        await patientRepo
            .uploadLabResultFirestore(patientModel: patientModel)
            .then((value) {
          value.fold((l) => emit(UploadLabResultFirestoreFailure(l.errMessage)),
              (r) => emit(UploadLabResultFirestoreSuccess()));
        });
        emit(UploadLabResultSuccess());
      });
    });
  }
}
