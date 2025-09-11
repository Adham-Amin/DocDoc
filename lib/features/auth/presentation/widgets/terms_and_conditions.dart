import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By signing up you agree to our ',
        style: AppStyles.textRegular12.copyWith(color: AppColors.grey),
        children: [
          TextSpan(
            text: 'Terms & Conditions',
            style: AppStyles.textRegular12.copyWith(color: AppColors.black),
          ),
          TextSpan(
            text: ' and ',
            style: AppStyles.textRegular12.copyWith(color: AppColors.grey),
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: AppStyles.textRegular12.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
