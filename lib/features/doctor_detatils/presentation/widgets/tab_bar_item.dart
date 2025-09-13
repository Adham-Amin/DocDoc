import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.textSemiBold16),
        HeightBox(8),
        Text(
          description,
          style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
