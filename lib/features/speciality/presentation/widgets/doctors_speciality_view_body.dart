import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/speciality/presentation/widgets/doctors_specialtity_lisy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityViewBody extends StatelessWidget {
  const DoctorsSpecialityViewBody({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HeightBox(16),
          CustomAppBar(title: title),
          HeightBox(32),
          DoctorsSpecialityList(),
        ],
      ),
    );
  }
}
