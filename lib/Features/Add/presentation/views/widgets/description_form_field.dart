import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_form_field.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    Key? key,
    required this.descriptionController,
  }) : super(key: key);

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
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
    );
  }
}
