import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Core/utils/functions/custom_toast.dart';
import 'package:magna/Core/widgets/note_form_field.dart';
import 'package:magna/Features/D&N/Home/presentation/view_models/lab_note_cubit/lab_note_cubit.dart';
import 'package:magna/Features/D&N/Home/presentation/view_models/lab_note_cubit/lab_note_state.dart';
import 'package:magna/constant.dart';

import '../../../../../Core/utils/styles.dart';

class ViewLabResultView extends StatelessWidget {
  const ViewLabResultView({Key? key, required this.patientModel})
      : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController noteController =
        TextEditingController(text: patientModel.labNote);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Lab Results',
          style: Styles.style24B,
        ),
        actions: [Image.asset('assets/images/MAGNA.jpg')],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: patientModel.labResults!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocConsumer<LabNoteCubit, LabNoteState>(
                listener: (context, state) {
                  BlocProvider.of<LabNoteCubit>(context).labNote;
                  if (state is LabNoteSuccess) {
                    Navigator.of(context).pop();
                  } else if (state is LabNoteFailure) {
                    showToast(text: state.errMessage, state: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  String labNote =
                      BlocProvider.of<LabNoteCubit>(context).labNote ??
                          patientModel.labNote ??
                          'Add your note';
                  return ListTile(
                    title: Text(
                      'Lap Note',
                      style: Styles.style20BB,
                    ),
                    subtitle: Text(
                      labNote,
                      style: Styles.style18B,
                    ),
                    trailing: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: SizedBox(
                                  height: 150.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      NoteTextField(
                                          noteController: noteController),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20.0.w),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            child: Text('save',
                                                style: Styles.style20BB),
                                            onPressed: () {
                                              if (noteController.text.isEmpty) {
                                                showToast(
                                                    text:
                                                        'Note can note be empty',
                                                    state: ToastStates.warning);
                                              } else {
                                                BlocProvider.of<LabNoteCubit>(
                                                        context)
                                                    .doctorLabNote(
                                                  patientModel: patientModel,
                                                  labNote: noteController.text,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
