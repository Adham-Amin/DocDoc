import 'package:docdoc/features/speciality/presentation/widgets/speciality_view_body.dart';
import 'package:flutter/material.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key, this.isNavigate});

  final bool? isNavigate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SpecialityViewBody(isNavigate: isNavigate)),
    );
  }
}
