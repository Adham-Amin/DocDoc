import 'package:docdoc/features/speciality/presentation/widgets/speciality_view_body.dart';
import 'package:flutter/material.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SpecialityViewBody()));
  }
}
