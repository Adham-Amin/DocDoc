import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/appointment/presentation/widgets/time_section.dart';
import 'package:flutter/material.dart';

class SelectedTimeSection extends StatelessWidget {
  const SelectedTimeSection({super.key, required this.selectTime});

  final Function(String) selectTime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Available time', style: AppStyles.textSemiBold18),
          HeightBox(24),
          TimeSlotPicker(selectedTime: selectTime),
        ],
      ),
    );
  }
}
