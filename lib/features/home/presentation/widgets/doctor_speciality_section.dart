import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/speciality_item.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/speciality/domain/entity/speciality_entity.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySection extends StatelessWidget {
  const DoctorSpecialitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Doctor Speciality', style: AppStyles.textSemiBold18),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.specialityView);
              },
              child: Text(
                'See All',
                style: AppStyles.textMedium12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        HeightBox(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 16,
            children: List.generate(
              6,
              (index) => SpecialityItem(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.doctorsSpecialityView,
                    arguments: {
                      'title': SpecialityEntity.specialities[index].name,
                      'id': SpecialityEntity.specialities[index].id,
                    },
                  );
                },
                radius: 32,
                category: SpecialityEntity.specialities[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
