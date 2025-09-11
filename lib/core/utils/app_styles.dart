import 'package:docdoc/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle textSemiBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textSemiBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textSemiBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textRegular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textGreyRegular10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle textBlod16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textBlod24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textPrimaryBlod32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 1.4,
  );
  static TextStyle textMedium14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textMedium18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textMedium12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
}
