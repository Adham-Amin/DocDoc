import 'package:docdoc/features/my_appointment/presentation/widgets/my_appointment_view_body.dart';
import 'package:flutter/material.dart';

class MyAppointmentView extends StatelessWidget {
  const MyAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MyAppointmentViewBody()));
  }
}
