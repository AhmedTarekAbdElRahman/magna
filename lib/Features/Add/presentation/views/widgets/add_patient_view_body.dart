import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/custom_button.dart';
import 'package:magna/Core/widgets/custom_drop_down_button.dart';
import 'package:magna/Core/widgets/custom_form_field.dart';
import 'package:magna/constant.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';

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
                SizedBox(
                  height: 20.h,
                ),
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
                CustomFormFiled(
                  controller: nameController,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter patient\'s name';
                    }
                    return null;
                  },
                  label: 'Patient\'s name',
                  prefix: Icons.person,
                  isPassword: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormFiled(
                  controller: phoneController,
                  type: TextInputType.phone,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter patient\'s phone';
                    }
                    return null;
                  },
                  label: 'Patient\'s phone',
                  prefix: Icons.phone,
                  isPassword: false,
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
                CustomFormFiled(
                  maxLines: 6,
                  controller: descriptionController,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter patient\'s description';
                    }
                    return null;
                  },
                  label: 'Patient\'s description',
                  prefix: Icons.description,
                  isPassword: false,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  formKey: formKey,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      return Navigator.of(context).pop();
                    }
                  },
                  text: 'Add',
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