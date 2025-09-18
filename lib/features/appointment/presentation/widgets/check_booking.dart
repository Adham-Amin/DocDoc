import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBooking extends StatelessWidget {
  const CheckBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65.h,
          width: 65.w,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Icon(Icons.check_outlined, color: AppColors.white, size: 32.r),
        ),
        HeightBox(24),
        Text(
          'Booking has been\nrescheduled',
          style: AppStyles.textBold18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
