import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/appointment/domain/repos/appointment_repo.dart';
import 'package:docdoc/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:docdoc/features/appointment/presentation/widgets/appointment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({
    super.key,
    required this.doctorId,
    required this.image,
  });

  final int doctorId;
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppointmentCubit(appointmentRepo: getIt<AppointmentRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: AppointmentViewBody(doctorId: doctorId, image: image),
        ),
      ),
    );
  }
}
