import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/presentation/widgets/banner_home.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_speciality_section.dart';
import 'package:docdoc/features/home/presentation/widgets/header_home.dart';
import 'package:docdoc/features/home/presentation/widgets/recommend_doctors_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderHome(),
            HeightBox(16),
            BannerHome(),
            HeightBox(24),
            DoctorSpecialitySection(),
            HeightBox(24),
            RecommendDoctorsSection(),
            HeightBox(16),
          ],
        ),
      ),
    );
  }
}
