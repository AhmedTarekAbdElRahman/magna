import 'package:flutter/material.dart';

class CustomFormFiled extends StatelessWidget {
  const CustomFormFiled({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    required this.validate,
    required this.label,
    this.prefix,
    this.suffix,
    this.suffixPress,
    this.onTap,
    this.isPassword = false,
    this.isClickable = true,
    this.maxLines = 1,
    this.autofocus = false,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? type;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final bool isPassword;
  final FormFieldValidator<String>? validate;
  final String? label;
  final IconData? prefix;
  final IconData? suffix;
  final VoidCallback? suffixPress;
  final GestureTapCallback? onTap;
  final bool isClickable;
  final int maxLines;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        autofocus: autofocus,
        maxLines: maxLines,
        enabled: isClickable,
        onTap: onTap,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPress,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
        ),
        validator: validate,
      ),
    );
  }
}
