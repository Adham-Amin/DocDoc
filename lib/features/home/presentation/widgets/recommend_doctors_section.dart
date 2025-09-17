import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/core/widgets/loading_doctor_list.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendDoctorsSection extends StatelessWidget {
  const RecommendDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recommended Doctors', style: AppStyles.textSemiBold18),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.recommendedDoctorsView,
                  arguments: context.read<HomeCubit>().allDoctors,
                );
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
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is HomeLoaded) {
              return ListView.separated(
                separatorBuilder: (context, index) => HeightBox(16),
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => DoctorCard(
                  image: DoctorEntity.doctorImages[index],
                  doctor: state.doctors[index],
                ),
              );
            } else {
              return LoadingDoctorList();
            }
          },
        ),
      ],
    );
  }
}
