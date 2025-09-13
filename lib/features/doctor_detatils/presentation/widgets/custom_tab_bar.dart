import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/about_doctor.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/location_dector.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/reviews_doctor.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            labelStyle: AppStyles.textBold16.copyWith(
              fontSize: 14.sp,
              color: AppColors.primary,
            ),
            unselectedLabelStyle: AppStyles.textBold16.copyWith(
              fontSize: 14.sp,
              color: AppColors.grey,
            ),
            indicatorColor: AppColors.primary,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'About'),
              Tab(text: 'Location'),
              Tab(text: 'Reviews'),
            ],
          ),
          HeightBox(24),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                AboutDoctor(doctor: widget.doctor),
                LocationDoctor(doctor: widget.doctor),
                ReviewsDoctor(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
