import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';
import 'package:docdoc/features/my_appointment/presentation/widgets/my_appointment_item.dart';
import 'package:flutter/material.dart';

class MyApoointmentList extends StatelessWidget {
  const MyApoointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 12,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => HeightBox(16),
        itemBuilder: (context, index) => MyAppointmentItem(
          image: DoctorEntity
              .doctorImages[index % DoctorEntity.doctorImages.length],
          myAppointment: MyAppointmentEntity(
            name: 'Dr. Randy Wigham',
            speciality: 'Dentist',
            degree: 'MBBS, MD',
            time: 'Saturday, October 18, 2025 4:00 PM',
          ),
        ),
      ),
    );
  }
}
