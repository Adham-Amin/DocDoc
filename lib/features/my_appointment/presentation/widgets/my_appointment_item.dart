import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentItem extends StatelessWidget {
  const MyAppointmentItem({
    super.key,
    required this.image,
    required this.myAppointment,
  });

  final String image;
  final MyAppointmentEntity myAppointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.bg.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  image,
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
              WidthBox(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myAppointment.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textBold16,
                    ),
                    HeightBox(8),
                    Text(
                      '${myAppointment.degree} | ${myAppointment.speciality}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textMedium12,
                    ),
                    HeightBox(8),
                    Text(
                      myAppointment.time,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textMedium12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: AppColors.grey.withValues(alpha: 0.2), height: 32.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.primary, width: 1.5.w),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    minimumSize: Size(double.infinity, 38.h),
                  ),
                  child: Text(
                    'Cancel',
                    style: AppStyles.textSemiBold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              WidthBox(16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    minimumSize: Size(double.infinity, 38.h),
                  ),
                  child: Text(
                    'Reschedule',
                    style: AppStyles.textSemiBold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
