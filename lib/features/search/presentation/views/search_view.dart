import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/features/search/domain/repo/search_repo.dart';
import 'package:docdoc/features/search/presentation/cubit/search_cubit.dart';
import 'package:docdoc/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(searchRepo: getIt<SearchRepo>()),
      child: Scaffold(body: SafeArea(child: const SearchViewBody())),
    );
  }
}
