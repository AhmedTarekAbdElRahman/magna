import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/custom_drop_down_button.dart';
import 'package:magna/Core/widgets/name_form_field.dart';
import 'package:magna/Core/widgets/phone_form_field.dart';
import 'package:magna/constant.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import 'add_patient_button.dart';
import 'description_form_field.dart';

class AddPatientViewBody extends StatelessWidget {
  const AddPatientViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var descriptionController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomAppBar(
            title: "NewPatient",
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
                            AssetImage('assets/images/download.png'),
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
                NameFormField(
                  nameController: nameController,
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
                const CustomDropDownButton(
                  text: 'Gender',
                  dropdownValue: gender,
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
                  formKey: formKey,
                  descriptionController: descriptionController,
                  nameController: nameController,
                  phoneController: phoneController,
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

