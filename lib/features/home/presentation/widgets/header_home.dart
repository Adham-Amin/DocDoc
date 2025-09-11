import 'package:docdoc/core/services/shared_preferences_service.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Hi, ${Prefs.getUser()!.name}!', style: AppStyles.textBold18),
      subtitle: Text(
        'How Are you Today?',
        style: AppStyles.textRegular12.copyWith(color: AppColors.grey),
      ),
      trailing: CircleAvatar(
        radius: 24.r,
        backgroundColor: AppColors.bg,
        child: Icon(Icons.notifications_outlined, size: 24.r),
      ),
    );
  }
}
