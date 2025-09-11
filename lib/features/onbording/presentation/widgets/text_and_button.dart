import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/services/shared_preferences_service.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndButton extends StatelessWidget {
  const TextAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            style: AppStyles.textGreyRegular10,
            textAlign: TextAlign.center,
          ),
          HeightBox(32),
          CustomButton(
            onTap: () {
              Prefs.setBool('seenOnboarding', true);
              Navigator.pushReplacementNamed(context, AppRoutes.loginView);
            },
            title: 'Get Started',
          ),
        ],
      ),
    );
  }
}
