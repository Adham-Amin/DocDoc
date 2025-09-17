import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingDoctorList extends StatelessWidget {
  const LoadingDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
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
}
