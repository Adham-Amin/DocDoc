import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.actions, required this.title});

  final Widget? actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.strocke),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.black,
            ),
          ),
        ),
        Text(title, style: AppStyles.textSemiBold18),
        actions != null
            ? GestureDetector(onTap: () {}, child: actions)
            : WidthBox(24),
      ],
    );
  }
}
