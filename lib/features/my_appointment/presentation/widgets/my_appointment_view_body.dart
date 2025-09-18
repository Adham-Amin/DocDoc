import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/my_appointment/presentation/widgets/my_appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentViewBody extends StatelessWidget {
  const MyAppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HeightBox(16),
          CustomAppBar(title: 'My Appointment'),
          HeightBox(32),
          MyApoointmentList(),
        ],
      ),
    );
  }
}
