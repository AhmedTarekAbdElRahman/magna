import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant.dart';

class ChestPainType extends StatefulWidget {
  const ChestPainType({Key? key, required this.text, required this.dropdownValue}) : super(key: key);
  final String text;
  final List<String> dropdownValue;
  @override
  State<ChestPainType> createState() => _ChestPainTypeState();
}

class _ChestPainTypeState extends State<ChestPainType> {
  @override
  void initState() {
    super.initState();
    chestPainType = widget.text;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chest Pain types',
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
                value: chestPainType,
                icon: const Icon(Icons.arrow_drop_down),
                items: widget.dropdownValue.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    chestPainType = value!;
                    //chestPainType=dropdownValue;
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
