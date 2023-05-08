import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant.dart';

class GenderRole extends StatefulWidget {
  const GenderRole({Key? key, required this.text, required this.dropdownValue}) : super(key: key);
  final String text;
  final List<String> dropdownValue;
  @override
  State<GenderRole> createState() => _GenderRoleState();
}

class _GenderRoleState extends State<GenderRole> {
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownValue.first;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
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
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                items: widget.dropdownValue.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                    patientGender=dropdownValue;
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
