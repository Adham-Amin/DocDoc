import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/custom_tab_bar.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/doctor_details_header.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeoctorDetailsViewBody extends StatelessWidget {
  const DeoctorDetailsViewBody({
    super.key,
    required this.doctor,
    required this.image,
  });

  final DoctorEntity doctor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(16),
          CustomAppBar(title: doctor.name),
          HeightBox(32),
          DoctorDetailsHeader(image: image, doctor: doctor),
          HeightBox(24),
          CustomTabBar(doctor: doctor),
          HeightBox(16),
          CustomButton(onTap: () {}, title: 'Make An Appointment'),
          HeightBox(16),
        ],
      ),
    );
  }
}
