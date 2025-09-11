import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/home/domain/repos/home_repo.dart';
import 'package:docdoc/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(homeRepo: getIt<HomeRepo>())..getAllDoctors(),
      child: Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
