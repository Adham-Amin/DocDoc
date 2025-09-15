import 'package:docdoc/features/appointment/presentation/widgets/appointment_details_view_body.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AppointmentDetailsViewBody(image: image)),
    );
  }
}
