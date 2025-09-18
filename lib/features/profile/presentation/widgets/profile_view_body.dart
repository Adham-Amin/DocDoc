import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/services/shared_preferences_service.dart';
import 'package:docdoc/core/utils/app_assets.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_list_tile.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeightBox(16),
        CustomAppBar(
          title: 'Profile',
          isNavigate: false,
          color: AppColors.white,
        ),
        HeightBox(100),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  children: [
                    HeightBox(80),
                    Text(
                      Prefs.getUser()!.name,
                      style: AppStyles.textSemiBold18.copyWith(fontSize: 20.sp),
                    ),
                    HeightBox(24),
                    CustomListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.personalInfoView,
                      ),
                      title: 'Personal Information',
                      icon: Icons.person,
                      color: Color(0xff247CFF),
                    ),
                    CustomListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.myAppointmentView,
                      ),
                      title: 'My Appointments',
                      icon: Icons.event_note,
                      color: Color(0xff22C55E),
                    ),
                    CustomListTile(
                      title: 'FAQ',
                      icon: Icons.question_mark,
                      color: Color(0xffFFC107),
                    ),
                    CustomListTile(
                      onTap: () {
                        deleteUserData();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.loginView,
                          (route) => false,
                        );
                      },
                      title: 'Logout',
                      icon: Icons.logout_outlined,
                      color: Color(0xffFF0000),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -60.h,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppAssets.imagesAvatar,
                  height: 120.h,
                  width: 120.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  deleteUserData() async {
    await Prefs.clearUserData();
    await Prefs.clearToken();
  }
}
