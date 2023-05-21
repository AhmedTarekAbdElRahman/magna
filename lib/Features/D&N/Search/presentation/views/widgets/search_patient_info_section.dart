import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/widgets/custom_loading_indicator.dart';
import '../../../../../../Core/model/patient_model/patient_model.dart';
import '../../../../../../Core/utils/functions/detect_chest_pain_type.dart';
import '../../../../../../Core/utils/styles.dart';
import '../../view_models/search_cubit/search_cubit.dart';
import '../../view_models/search_cubit/search_state.dart';

class SearchPatientInfoSection extends StatelessWidget {
  const SearchPatientInfoSection({
    Key? key,
    required this.patientModel, required this.index,
  }) : super(key: key);
  final int index;
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Name:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.name!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Phone:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.phone!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Gender:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.gender!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Description:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.description!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Age:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.age!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Chest pain type:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: detectChestPainType(patientModel.chestPainType!),
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Cholesterol:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.cholesterol!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Exercise angina:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.exerciseAngina! == '0' ? 'No' : 'Yes',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: 'Fasting blood sugar:  ',
                style: Styles.style24BB,
                children: <TextSpan>[
                  TextSpan(
                      text: patientModel.fastingBloodSugar!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          SearchPrediction(index: index),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          )
        ],
      ),
    );
  }
}

class SearchPrediction extends StatelessWidget {
  const SearchPrediction({
    Key? key, required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state){
          if(state is SearchSuccess){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'ECG:  ',
                      style: Styles.style24BB,
                      children: <TextSpan>[
                        TextSpan(
                            text: state.searchModel[index].ecg?? 'No reads yet',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Max heart rate:  ',
                      style: Styles.style24BB,
                      children: <TextSpan>[
                        TextSpan(
                            text: state.searchModel[index].maxHeartRate?? 'No reads yet',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  text: TextSpan(
                      text: 'prediction:  ',
                      style: Styles.style24BB,
                      children: <TextSpan>[
                        TextSpan(
                            text: state.searchModel[index].prediction,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
              ],
            );
          }
         else{
            return const CustomLoadingIndicator();
          }
        });
  }
}
