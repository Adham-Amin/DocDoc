import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/auth/domain/repos/auth_repo.dart';
import 'package:docdoc/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:docdoc/features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body: SafeArea(child: RegisterViewBody())),
    );
  }
}
