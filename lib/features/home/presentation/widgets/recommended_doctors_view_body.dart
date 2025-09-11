import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/home/presentation/widgets/recommended_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedDoctorsViewBody extends StatelessWidget {
  const RecommendedDoctorsViewBody({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HeightBox(16),
          CustomAppBar(
            title: 'Recommended Doctors',
            actions: Icon(Icons.filter_list, color: AppColors.black),
          ),
          HeightBox(32),
          RecommendedDoctorsList(doctors: doctors),
        ],
      ),
    );
  }
}
