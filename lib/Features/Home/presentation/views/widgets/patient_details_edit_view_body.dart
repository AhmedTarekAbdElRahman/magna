import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/name_form_field.dart';
import 'package:magna/Core/widgets/phone_form_field.dart';
import 'package:magna/Core/widgets/description_form_field.dart';
import 'package:magna/Features/Home/presentation/views/widgets/change_patient_profile_widget.dart';
import '../../../../../Core/model/patient_model/patient_model.dart';
import '../../../../../Core/widgets/age_form_field.dart';
import '../../../../../Core/widgets/chest_pain_type_button.dart';
import '../../../../../Core/widgets/cholesterol_form_field.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../../../../Core/widgets/exercise_angina_button.dart';
import '../../../../../Core/widgets/fasting_blood_sugar_form_field.dart';
import '../../../../../Core/widgets/gender_button.dart';
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
    var phoneController = TextEditingController(text: '${patientModel.phone}');
    var descriptionController =
        TextEditingController(text: patientModel.description);
    var ageController = TextEditingController(text: patientModel.age);
    var cholesterolController =
        TextEditingController(text: patientModel.cholesterol);
    var fastingBloodSugarController =
        TextEditingController(text: patientModel.fastingBloodSugar);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomAppBar(
            title: "Update Patient",
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ChangePatientImageWidget(image: patientModel.image!),
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
                AgeFormField(
                  ageController: ageController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                FastingBloodSugarFormField(
                  fastingBloodSugar: fastingBloodSugarController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CholesterolFormField(
                  cholesterolController: cholesterolController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const GenderRole(
                  text: 'Gender',
                  dropdownValue: gender,
                ),
                const ExerciseAngina(
                  text: 'Exercise Angina',
                  dropdownValue: exerciseAngina,
                ),
                const ChestPainType(
                  text: 'Chest Pain types',
                  dropdownValue: chestPainTypes,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DescriptionFormField(
                    descriptionController: descriptionController),
                SizedBox(
                  height: 20.h,
                ),
                UpdateButton(
                  formKey: formKey,
                  nameController: nameController,
                  phoneController: phoneController,
                  descriptionController: descriptionController,
                  id: patientModel.id!,
                  ageController: ageController,
                  cholesterolController: cholesterolController,
                  fastingBloodSugarController: cholesterolController,
                  image: patientModel.image!,
                ),
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
