import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Core/utils/functions/custom_toast.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/Core/widgets/custom_app_bar.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import 'package:magna/Features/Patient/presentation/view_models/upload_lab_result_cubit/upload_lab_result_cubit.dart';
import 'package:magna/Features/Patient/presentation/view_models/upload_lab_result_cubit/upload_lab_result_state.dart';
import 'package:magna/constant.dart';

import '../../../../Core/utils/functions/custom_alert.dart';

class UploadLabResultView extends StatelessWidget {
  const UploadLabResultView({Key? key, required this.patientModel})
      : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Upload lab result'),
          BlocConsumer<UploadLabResultCubit, UploadLabResultState>(
            listener: (context, state) {
              if (state is UploadLabResultFailure) {
                showToast(text: state.errMessage, state: ToastStates.error);
              } else if (state is UploadLabResultFirestoreFailure) {
                showToast(text: state.errMessage, state: ToastStates.error);
              }else if(state is UploadLabResultFirestoreSuccess){
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              var patientImage =
                  BlocProvider.of<UploadLabResultCubit>(context).patientImage;
              return patientImage == null
                  ? Expanded(
                      child: Center(
                        child: Text(
                          'Upload your lab result please',
                          style: Styles.style24B,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.file(
                              patientImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          state is UploadLabResultLoading
                              ? const CustomLoadingIndicator()
                              : UploadButton(patientModel: patientModel),
                        ],
                      ),
                    );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () async {
          customAlert(
              context: context,
              getGallery: () {
                Navigator.of(context).pop();
                BlocProvider.of<UploadLabResultCubit>(context)
                    .getImage(ImageSource.gallery);
              },
              getCamera: () {
                Navigator.of(context).pop();
                BlocProvider.of<UploadLabResultCubit>(context)
                    .getImage(ImageSource.camera);
              });
        },
        label: Row(
          children: [
            const Text('Add Image'),
            SizedBox(
              width: 5.w,
            ),
            const Icon(Icons.camera_alt_outlined)
          ],
        ),
      ),
    );
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({
    Key? key,
    required this.patientModel,
  }) : super(key: key);

  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kPrimaryColor,
      ),
      child: TextButton(
        onPressed: () {
          BlocProvider.of<UploadLabResultCubit>(context)
              .uploadLabResult(patientModel: patientModel);
        },
        child: Text(
          'Upload',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
