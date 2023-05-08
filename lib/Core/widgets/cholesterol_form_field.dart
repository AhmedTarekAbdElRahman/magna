import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class CholesterolFormField extends StatelessWidget {
  const CholesterolFormField({
    Key? key,
    required this.cholesterolController,
  }) : super(key: key);

  final TextEditingController cholesterolController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: cholesterolController,
      type: TextInputType.number,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your cholesterol';
        }
        return null;
      },
      label: 'Cholesterol',
      prefix: Icons.timeline,
    );
  }
}