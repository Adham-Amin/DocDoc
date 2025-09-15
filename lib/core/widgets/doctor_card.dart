import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
    required this.image,
    this.navigate,
  });

  final DoctorEntity doctor;
  final String image;
  final bool? navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate == null
          ? () {
              Navigator.pushNamed(
                context,
                AppRoutes.doctorDetailsView,
                arguments: {'doctor': doctor, 'image': image},
              );
            }
          : null,
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
    );
  }
}
