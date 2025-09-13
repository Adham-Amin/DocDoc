import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/tab_bar_item.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TabBarItem(
          title: 'About Me',
          description:
              'Dr. ${doctor.name} is a leading ${doctor.speciality} specialist at ${doctor.city} Hospital in ${doctor.address}. She has received several awards for her outstanding contributions to the medical field. She is available for private consultation.',
        ),
        HeightBox(24),
        TabBarItem(
          title: 'Working Time',
          description: 'Mon - Fri ${doctor.startTime} - ${doctor.endTime}',
        ),
        HeightBox(24),
        TabBarItem(
          title: 'Contact',
          description: 'Phone: ${doctor.phone}\nEmail: ${doctor.email}',
        ),
        HeightBox(24),
        TabBarItem(
          title: 'Price',
          description: '\$${doctor.price} per session',
        ),
      ],
    );
  }
}
