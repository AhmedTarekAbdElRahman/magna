import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../../Core/utils/app_routers.dart';
import 'delete_item_button.dart';
import 'edit_item_button.dart';

class DoctorPatientsListViewItem extends StatelessWidget {
  const DoctorPatientsListViewItem({
    Key? key,
    required this.patientModel,
  }) : super(key: key);
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return  Card(
        margin: const EdgeInsets.all(10),
        elevation: 15.0,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.of(context)
                .pushNamed(Routes.kPatientDetailsView, arguments: patientModel);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: patientModel.id!,
                child: CachedNetworkImage(
                  imageUrl: patientModel.image!,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            patientModel.name!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            patientModel.description!,
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}


