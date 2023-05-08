import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class FastingBloodSugarFormField extends StatelessWidget {
  const FastingBloodSugarFormField({
    Key? key,
    required this.fastingBloodSugar,
  }) : super(key: key);

  final TextEditingController fastingBloodSugar;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: fastingBloodSugar,
      type: TextInputType.number,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your fasting blood sugar';
        }
        return null;
      },
      label: 'Fasting Blood Sugar',
      prefix: Icons.bloodtype,
    );
  }
}