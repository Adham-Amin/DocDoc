import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/home/presentation/widgets/recommended_doctors_view_body.dart';
import 'package:flutter/material.dart';

class RecommendedDoctorsView extends StatelessWidget {
  const RecommendedDoctorsView({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: RecommendedDoctorsViewBody(doctors: doctors)),
    );
  }
}
