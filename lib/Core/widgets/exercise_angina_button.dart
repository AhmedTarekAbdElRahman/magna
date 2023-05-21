import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant.dart';

class ExerciseAngina extends StatefulWidget {
  const ExerciseAngina({Key? key, required this.text, required this.dropdownValue}) : super(key: key);
  final String text;
  final List<String> dropdownValue;
  @override
  State<ExerciseAngina> createState() => _ExerciseAnginaState();
}

class _ExerciseAnginaState extends State<ExerciseAngina> {
  @override
  void initState() {
    super.initState();
    exerciseAnginaState = widget.text;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exercise Angina',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey[800],
            ),
          ),
          InputDecorator(
            decoration:  const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              contentPadding: EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: exerciseAnginaState,
                icon: const Icon(Icons.arrow_drop_down),
                items: widget.dropdownValue.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    exerciseAnginaState = value!;
                  });
                },
                borderRadius: BorderRadius.circular(16),
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
