import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/speciality/domain/repos/speciality_repo.dart';
import 'package:docdoc/features/speciality/presentation/cubit/speciality_cubit.dart';
import 'package:docdoc/features/speciality/presentation/widgets/doctors_speciality_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsSpecialityView extends StatelessWidget {
  const DoctorsSpecialityView({
    super.key,
    required this.title,
    required this.specialityId,
  });

  final String title;
  final num specialityId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SpecialityCubit(specialityRepo: getIt<SpecialityRepo>())
            ..getSpecialityDoctors(specialityId: specialityId),
      child: Scaffold(
        body: SafeArea(child: DoctorsSpecialityViewBody(title: title)),
      ),
    );
  }
}
