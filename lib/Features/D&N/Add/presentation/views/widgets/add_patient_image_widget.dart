import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../Core/utils/functions/custom_alert.dart';
import '../../../../../../constant.dart';
import '../../view_models/add_patient_cubit/add_patient_cubit.dart';
import '../../view_models/add_patient_cubit/add_patient_state.dart';

class AddPatientImageWidget extends StatelessWidget {
  const AddPatientImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPatientCubit, AddPatientState>(
      builder: (context, state) {
        var patientImage =
            BlocProvider.of<AddPatientCubit>(context).patientImage;
        return Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.height / 9.8,
                backgroundColor: Colors.transparent,
                child: patientImage == null
                    ? ClipOval(
                        child: Image.asset(
                          'assets/images/download.jpg',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipOval(
                        child: Image(
                          image: FileImage(patientImage),
                          height: double.infinity,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
              IconButton(
                onPressed: () async {
                  customAlert(
                      context: context,
                      getGallery: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<AddPatientCubit>(context)
                            .getProfileImage(ImageSource.gallery);
                      },
                      getCamera: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<AddPatientCubit>(context)
                            .getProfileImage(ImageSource.camera);
                      });
                },
                icon: const CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
