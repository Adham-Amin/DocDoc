import 'package:docdoc/core/helper/search_history_helper.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/core/widgets/loading_doctor_list.dart';
import 'package:docdoc/features/search/presentation/cubit/search_cubit.dart';
import 'package:docdoc/features/search/presentation/widgets/doctor_search_list.dart';
import 'package:docdoc/features/search/presentation/widgets/recent_search_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HeightBox(16),
          CustomAppBar(title: 'Search', isNavigate: false),
          HeightBox(32),
          CustomTextFormField(
            onChanged: (q) {
              context.read<SearchCubit>().search(query: q);
            },
            onFieldSubmitted: (q) async {
              if (q.isNotEmpty) {
                await SearchHistoryHelper.addSearchHistory(query: q);
                setState(() {});
              }
            },
            controller: controller,
            hintText: 'Search',
            suffixIcon: Icon(Icons.search, color: AppColors.grey),
          ),
          HeightBox(32),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  if (controller.text.isEmpty) {
                    return RecentSearchSection(
                      onChanged: (query) {
                        context.read<SearchCubit>().search(query: query);
                        controller.text = query;
                        setState(() {});
                      },
                    );
                  }
                  if (state.doctors.isEmpty || state.doctors == []) {
                    return Center(
                      child: Text(
                        'No Doctors Found',
                        style: AppStyles.textBold16.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    );
                  }
                  return DoctorSearchList(doctors: state.doctors);
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                } else if (state is SearchLoading) {
                  return Expanded(child: LoadingDoctorList());
                } else {
                  return RecentSearchSection(
                    onChanged: (query) {
                      context.read<SearchCubit>().search(query: query);
                      controller.text = query;
                      setState(() {});
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
