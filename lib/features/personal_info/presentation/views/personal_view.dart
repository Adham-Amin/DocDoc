import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/personal_info/domain/repo/personal_repo.dart';
import 'package:docdoc/features/personal_info/presentation/cubit/personal_cubit.dart';
import 'package:docdoc/features/personal_info/presentation/widgets/personal_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalCubit(personalRepo: getIt<PersonalRepo>()),
      child: Scaffold(body: SafeArea(child: PersonalViewBody())),
    );
  }
}
