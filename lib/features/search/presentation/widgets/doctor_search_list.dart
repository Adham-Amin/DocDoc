import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';

class DoctorSearchList extends StatelessWidget {
  const DoctorSearchList({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${doctors.length} Founds', style: AppStyles.textSemiBold18),
        HeightBox(24),
        Expanded(
          child: ListView.separated(
            itemCount: doctors.length,
            separatorBuilder: (context, index) => HeightBox(16),
            itemBuilder: (context, index) => DoctorCard(
              doctor: doctors[index],
              image: DoctorEntity
                  .doctorImages[index % DoctorEntity.doctorImages.length],
            ),
          ),
        ),
      ],
    );
  }
}
