import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/rating_and_comment.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsHeader extends StatelessWidget {
  const DoctorDetailsHeader({
    super.key,
    required this.image,
    required this.doctor,
  });

  final String image;
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(
            image,
            height: 74.h,
            width: 74.w,
            fit: BoxFit.cover,
          ),
        ),
        WidthBox(12),
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
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return RatingAndComment();
              },
            );
          },
          child: Icon(
            Icons.comment_outlined,
            color: AppColors.primary,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
