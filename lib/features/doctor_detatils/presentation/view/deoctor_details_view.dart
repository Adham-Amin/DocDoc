import 'package:docdoc/features/doctor_detatils/presentation/widgets/deoctor_details_view_body.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';

class DeoctorDetailsView extends StatelessWidget {
  const DeoctorDetailsView({
    super.key,
    required this.doctor,
    required this.image,
  });

  final DoctorEntity doctor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DeoctorDetailsViewBody(doctor: doctor, image: image),
      ),
    );
  }
}
