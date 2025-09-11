import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/onbording/presentation/widgets/image_and_title.dart';
import 'package:docdoc/features/onbording/presentation/widgets/logo_and_name.dart';
import 'package:docdoc/features/onbording/presentation/widgets/text_and_button.dart';
import 'package:flutter/material.dart';

class OnbordingViewBody extends StatelessWidget {
  const OnbordingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeightBox(22),
          LogoAndName(),
          HeightBox(42),
          ImageAndTitle(),
          TextAndButton(),
          HeightBox(32),
        ],
      ),
    );
  }
}
