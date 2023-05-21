import 'package:flutter/material.dart';
import 'package:magna/Core/widgets/custom_form_field.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({Key? key, required this.noteController}) : super(key: key);
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return CustomFormFiled(
      controller: noteController,
      type: TextInputType.text,
      autofocus: true,
      validate: (String? value) {
        if (value!.isEmpty) {
          return 'Please,enter your note';
        }
        return null;
      },
      label: 'Note',
      );
  }
}
