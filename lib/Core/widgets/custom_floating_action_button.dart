import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);
  final VoidCallback function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      child: Icon(icon),
    );
  }
}
