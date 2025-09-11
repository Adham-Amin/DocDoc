import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/speciality/domain/entity/speciality_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityItem extends StatelessWidget {
  const SpecialityItem({
    super.key,
    required this.category,
    this.onTap,
    required this.radius,
    this.textStyle,
  });

  final SpecialityEntity category;
  final VoidCallback? onTap;
  final double radius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: radius.r,
            backgroundColor: AppColors.bgCategory,
            child: Image.asset(
              category.image,
              height: radius.h,
              width: radius.w,
            ),
          ),
          HeightBox(12),
          Text(category.name, style: textStyle ?? AppStyles.textRegular12),
        ],
      ),
    );
  }
}
