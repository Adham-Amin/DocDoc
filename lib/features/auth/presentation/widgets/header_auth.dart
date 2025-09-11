import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60.h),
        Text(
          title,
          style: AppStyles.textBlod24.copyWith(color: AppColors.primary),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
