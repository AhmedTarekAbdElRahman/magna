import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/chest_pain_type_button.dart';
import 'package:magna/Core/widgets/confirm_password_field.dart';
import 'package:magna/Core/widgets/email_form_field.dart';
import 'package:magna/Core/widgets/exercise_angina_button.dart';
import 'package:magna/Core/widgets/fasting_blood_sugar_form_field.dart';
import 'package:magna/Core/widgets/name_form_field.dart';
import 'package:magna/Core/widgets/password_form_field.dart';
import 'package:magna/Core/widgets/phone_form_field.dart';
import 'package:magna/constant.dart';
import '../../../../../../Core/widgets/age_form_field.dart';
import '../../../../../../Core/widgets/cholesterol_form_field.dart';
import '../../../../../../Core/widgets/custom_app_bar.dart';
import '../../../../../../Core/widgets/description_form_field.dart';
import '../../../../../../Core/widgets/gender_button.dart';
import 'add_patient_button.dart';
import 'add_patient_image_widget.dart';

class AddPatientViewBody extends StatelessWidget {
  const AddPatientViewBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var phoneController = TextEditingController();
    var descriptionController = TextEditingController();
    var ageController = TextEditingController();
    var cholesterolController = TextEditingController();
    var fastingBloodSugarController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomAppBar(
            title: "New Patient",
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const AddPatientImageWidget(),
                SizedBox(
                  height: 20.h,
                ),
                NameFormField(
                  nameController: nameController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                EmailFormField(
                  emailController: emailController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PasswordFormField(
                  passwordController: passwordController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ConfirmPasswordFormField(
                  confirmPasswordController: confirmPasswordController,
                  passwordController: passwordController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PhoneFormField(
                  phoneController: phoneController,
                ),
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
                  text: 'Yes',
                  dropdownValue: exerciseAngina,
                ),
                const ChestPainType(
                  text: 'Typical Angina',
                  dropdownValue: chestPainTypes,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DescriptionFormField(
                  descriptionController: descriptionController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AddPatientButton(
                  doctorName: doctorName!,
                  formKey: formKey,
                  descriptionController: descriptionController,
                  nameController: nameController,
                  phoneController: phoneController,
                  ageController: ageController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  cholesterolController: cholesterolController,
                  fastingBloodSugarController: cholesterolController,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
