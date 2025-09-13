import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({super.key});

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Give Rate', style: AppStyles.textSemiBold18),
        HeightBox(24),
        StarRating(
          rating: rating,
          size: 40.sp,
          starCount: 5,
          allowHalfRating: false,
          emptyIcon: Icons.star,
          color: AppColors.yellow,
          borderColor: AppColors.grey.withValues(alpha: 0.2),
          onRatingChanged: (value) {
            setState(() {
              rating = value;
            });
          },
        ),
      ],
    );
  }
}
