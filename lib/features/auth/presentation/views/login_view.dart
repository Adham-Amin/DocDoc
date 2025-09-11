import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/auth/domain/repos/auth_repo.dart';
import 'package:docdoc/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:docdoc/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body: SafeArea(child: const LoginViewBody())),
    );
  }
}
