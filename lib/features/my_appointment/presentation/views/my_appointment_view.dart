import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/my_appointment/domain/repo/my_appointment_repo.dart';
import 'package:docdoc/features/my_appointment/presentation/cubit/my_appointment_cubit.dart';
import 'package:docdoc/features/my_appointment/presentation/widgets/my_appointment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentView extends StatelessWidget {
  const MyAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyAppointmentCubit(myAppointmentRepo: getIt<MyAppointmentRepo>())
            ..getMyAppointments(),
      child: Scaffold(body: SafeArea(child: MyAppointmentViewBody())),
    );
  }
}
