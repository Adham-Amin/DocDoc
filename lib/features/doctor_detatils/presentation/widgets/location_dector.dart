import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/tab_bar_item.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';

class LocationDoctor extends StatelessWidget {
  const LocationDoctor({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TabBarItem(title: 'Location', description: doctor.address),
        HeightBox(24),
        TabBarItem(
          title: 'City',
          description: '${doctor.governrate}, ${doctor.city}',
        ),
      ],
    );
  }
}
