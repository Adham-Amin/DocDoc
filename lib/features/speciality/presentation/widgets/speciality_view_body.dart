import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/speciality_item.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/speciality/domain/entity/speciality_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityViewBody extends StatelessWidget {
  const SpecialityViewBody({super.key, this.isNavigate});

  final bool? isNavigate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeightBox(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomAppBar(
            title: 'Doctor Speciality',
            isNavigate: isNavigate,
          ),
        ),
        HeightBox(32),
        Expanded(
          child: GridView.builder(
            itemCount: SpecialityEntity.specialities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) => SpecialityItem(
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
              category: SpecialityEntity.specialities[index],
              radius: 64,
              textStyle: AppStyles.textSemiBold16,
            ),
          ),
        ),
      ],
    );
  }
}
