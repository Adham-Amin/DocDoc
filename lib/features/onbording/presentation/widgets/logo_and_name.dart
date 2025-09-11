import 'package:docdoc/core/utils/app_assets.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.svgsLogo),
        WidthBox(8),
        Text('Docdoc', style: AppStyles.textBlod24),
      ],
    );
  }
}
