import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: nameController,
      type: TextInputType.name,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your name';
        }
        return null;
      },
      label: 'Name',
      prefix: Icons.person,);
  }
}
