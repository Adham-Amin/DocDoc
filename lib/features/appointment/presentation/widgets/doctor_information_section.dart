import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';

class DoctorInformationSection extends StatelessWidget {
  const DoctorInformationSection({
    super.key,
    required this.image,
    required this.doctor,
  });

  final String image;
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Doctor Information', style: AppStyles.textSemiBold16),
        HeightBox(24),
        DoctorCard(navigate: false, doctor: doctor, image: image),
      ],
    );
  }
}
