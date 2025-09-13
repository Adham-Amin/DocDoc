import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/custom_snack_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/comment_section.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/rating_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingAndComment extends StatelessWidget {
  const RatingAndComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 4.h,
            color: AppColors.grey.withValues(alpha: 0.5),
            endIndent: 150.w,
            indent: 150.w,
          ),
          HeightBox(16),
          RatingSection(),
          HeightBox(32),
          CommentSection(),
          HeightBox(32),
          CustomButton(
            onTap: () {
              Navigator.pop(context);
              customSnackBar(
                context: context,
                message: 'Thank you for your review!',
                type: AnimatedSnackBarType.success,
              );
            },
            title: 'Submit Review',
          ),
          HeightBox(16),
        ],
      ),
    );
  }
}
