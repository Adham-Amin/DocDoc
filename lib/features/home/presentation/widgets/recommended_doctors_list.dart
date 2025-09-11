import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';

class RecommendedDoctorsList extends StatelessWidget {
  const RecommendedDoctorsList({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: doctors.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => DoctorCard(
          image: DoctorEntity
              .doctorImages[index % DoctorEntity.doctorImages.length],
          doctor: doctors[index],
        ),
        separatorBuilder: (context, index) => HeightBox(16),
      ),
    );
  }
}
