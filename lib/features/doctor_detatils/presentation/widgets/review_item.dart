import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/domain/entities/review_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 24.r,
              backgroundImage: AssetImage(review.image),
            ),
            title: Text(review.name, style: AppStyles.textBold16),
            subtitle: Text(
              '5 Reviews',
              style: AppStyles.textMedium12.copyWith(color: AppColors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                5,
                (index) =>
                    Icon(Icons.star, color: AppColors.yellow, size: 16.sp),
              ),
            ),
          ),
          HeightBox(4),
          Text(
            review.comment,
            style: AppStyles.textRegular12.copyWith(
              height: 1.5,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
