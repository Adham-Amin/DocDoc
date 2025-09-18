import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(icon, color: color, size: 24.sp),
            ),
            title: Text(title, style: AppStyles.textSemiBold14),
            subtitle: subtitle == null
                ? null
                : Text(
                    subtitle!,
                    style: AppStyles.textRegular12.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
          ),
        ),
        Divider(
          thickness: 1.h,
          color: AppColors.grey.withValues(alpha: 0.25),
          height: 24.h,
        ),
      ],
    );
  }
}
