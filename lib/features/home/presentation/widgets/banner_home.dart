import 'package:docdoc/core/utils/app_assets.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book and\nschedule with\nnearest doctors',
                style: AppStyles.textMedium18.copyWith(color: AppColors.white),
              ),
              HeightBox(16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: Text(
                  'Find Nearby',
                  style: AppStyles.textRegular12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 16.w,
          bottom: 0,
          child: Image.asset(
            AppAssets.imagesDocBanner,
            height: 192.h,
            width: 136.w,
          ),
        ),
      ],
    );
  }
}
