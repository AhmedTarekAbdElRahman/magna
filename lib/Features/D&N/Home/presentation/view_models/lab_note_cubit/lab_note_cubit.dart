import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/model/patient_model/patient_model.dart';
import '../../../data/repos/home_repo.dart';
import 'lab_note_state.dart';

class LabNoteCubit extends Cubit<LabNoteState> {
  LabNoteCubit(
    this.homeRepo,
  ) : super(LabNoteInitial());
  final HomeRepo homeRepo;
  String? labNote;
  Future<void> doctorLabNote({required PatientModel patientModel,required String labNote}) async {
    patientModel.labNote=labNote;
    this.labNote=labNote;
    emit(LabNoteLoading());
    await homeRepo
        .editPatient(patientModel:patientModel)
        .then((value) {
      value.fold((l) => emit(LabNoteFailure(l.errMessage)),
          (r) => emit(LabNoteSuccess()));
    });
  }
}
