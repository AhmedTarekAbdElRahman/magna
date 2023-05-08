import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class AgeFormField extends StatelessWidget {
  const AgeFormField({
    Key? key,
    required this.ageController,
  }) : super(key: key);

  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: ageController,
      type: TextInputType.number,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your age';
        }
        return null;
      },
      label: 'Age',
      prefix: Icons.accessibility,
    );
  }
}