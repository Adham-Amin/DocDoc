import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(child: ProfileViewBody()),
    );
  }
}
