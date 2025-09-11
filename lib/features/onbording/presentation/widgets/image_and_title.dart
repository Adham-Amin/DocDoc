import 'package:docdoc/core/utils/app_assets.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageAndTitle extends StatelessWidget {
  const ImageAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.svgsBackgroundLogo),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.white, AppColors.white.withValues(alpha: 0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.14, 0.4],
            ),
          ),
          child: Image.asset(AppAssets.imagesDocImage),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Text(
            'Best Doctor \n Appointment App',
            style: AppStyles.textPrimaryBlod32,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
