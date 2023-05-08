import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    Key? key,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: phoneController,
      type: TextInputType.phone,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your phone';
        }
        if(value.length != 11){
          return 'Please,enter 11 numbers';
        }
        return null;
      },
      label: 'Phone',
      prefix: Icons.phone,
    );
  }
}