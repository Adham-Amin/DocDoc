import 'package:docdoc/features/appointment/presentation/widgets/appointment_view_body.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key, required this.doctorId});

  final int doctorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AppointmentViewBody(doctorId: doctorId)),
    );
  }
}
