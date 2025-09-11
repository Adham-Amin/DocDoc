import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/speciality/presentation/cubit/speciality_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorsSpecialityList extends StatelessWidget {
  const DoctorsSpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialityCubit, SpecialityState>(
      builder: (context, state) {
        if (state is SpecialityError) {
          return Center(child: Text(state.message));
        } else if (state is SpecialityLoaded) {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => HeightBox(16),
              itemCount: state.doctors.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => DoctorCard(
                image: DoctorEntity
                    .doctorImages[index % DoctorEntity.doctorImages.length],
                doctor: state.doctors[index],
              ),
            ),
          );
        } else {
          return Expanded(
            child: Skeletonizer(
              enabled: true,
              child: ListView.separated(
                separatorBuilder: (context, index) => HeightBox(16),
                itemCount: 6,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => DoctorCard(
                  image: DoctorEntity.doctorImages[index],
                  doctor: DoctorEntity(
                    id: 1,
                    name: 'Dr. Randy Wigham',
                    speciality: 'General',
                    degree: 'Gastroenterology',
                    city: 'RSUD Gatot Subroto',
                    governrate: 'Town',
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
