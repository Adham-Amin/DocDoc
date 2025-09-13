import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              return Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  separatorBuilder: (context, index) => HeightBox(16),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => DoctorCard(
                    image: DoctorEntity.doctorImages[index],
                    doctor: DoctorEntity(
                      phone: '0000000000',
                      email: 'V7dM6@example.com',
                      address: 'address',
                      startTime: '00:00',
                      endTime: '00:00',
                      price: 0,
                      id: 1,
                      name: 'Dr. Randy Wigham',
                      speciality: 'General',
                      degree: 'Gastroenterology',
                      city: 'RSUD Gatot Subroto',
                      governrate: 'Town',
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
