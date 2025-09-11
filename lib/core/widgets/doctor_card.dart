import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    this.onTap,
    required this.doctor,
    required this.image,
  });

  final VoidCallback? onTap;
  final DoctorEntity doctor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                image,
                height: 110.h,
                width: 110.w,
                fit: BoxFit.cover,
              ),
            ),
            WidthBox(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textBold16,
                  ),
                  HeightBox(8),
                  Text(
                    '${doctor.degree} | ${doctor.speciality}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textMedium12,
                  ),
                  HeightBox(8),
                  Text(
                    '${doctor.governrate} - ${doctor.city}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textMedium12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
