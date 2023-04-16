import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'delete_patient_state.dart';

class DeletePatientCubit extends Cubit<DeletePatientState> {
  DeletePatientCubit(this.homeRepo) : super(DeletePatientInitial());
  final HomeRepo homeRepo;

  Future<void> deletePatient({required String patientId}) async {
    emit(DeletePatientLoading());
    final result = await homeRepo.deletePatient(patientId: patientId);
    result.fold(
      (e) => emit(DeletePatientFailure(e.errMessage)),
      (r) => emit(DeletePatientSuccess()),
    );
  }
}
