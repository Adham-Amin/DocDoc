import 'package:docdoc/features/onbording/presentation/widgets/onbording_view_body.dart';
import 'package:flutter/material.dart';

class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const OnbordingViewBody()));
  }
}
