import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/name_form_field.dart';
import 'package:magna/Core/widgets/phone_form_field.dart';
import 'package:magna/Features/Add/presentation/views/widgets/description_form_field.dart';
import '../../../../../Core/model/patient_model/patient_model.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../../../../constant.dart';
import 'update_patient_button.dart';

class PatientDetailsEditViewBody extends StatelessWidget {
  const PatientDetailsEditViewBody({Key? key, required this.patientModel})
      : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var nameController = TextEditingController(text: patientModel.name);
    var phoneController = TextEditingController(text: patientModel.phone);
    var descriptionController =
        TextEditingController(text: patientModel.description);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomAppBar(
            title: "UpdatePatient",
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/patient.jpg'),
                      ),
                      IconButton(
                        onPressed: () {},
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
                ),
                SizedBox(
                  height: 20.h,
                ),
                NameFormField(nameController: nameController),
                SizedBox(
                  height: 10.h,
                ),
                PhoneFormField(phoneController: phoneController),
                SizedBox(
                  height: 10.h,
                ),
                DescriptionFormField(descriptionController: descriptionController),
                SizedBox(
                  height: 20.h,
                ),
                UpdateButton(formKey: formKey, nameController: nameController, phoneController: phoneController, descriptionController: descriptionController, id: patientModel.id!,),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

