import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/model/patient_model/patient_model.dart';
import '../../../data/repos/home_repo.dart';
import 'home_service_state.dart';

class HomeServiceCubit extends Cubit<HomeServiceState> {
  HomeServiceCubit(
    this.homeRepo,
  ) : super(HomeServiceInitial());
  final HomeRepo homeRepo;
  bool? atHome;
  Future<void> homeService({required PatientModel patientModel,required bool atHome}) async {
    patientModel.atHome=atHome;
    this.atHome=atHome;
    emit(HomeServiceLoading());
    await homeRepo
        .editPatient(patientModel:patientModel)
        .then((value) {

      value.fold((l) => emit(HomeServiceFailure(l.errMessage)),
          (r) => emit(HomeServiceSuccess()));
    });
  }
}
