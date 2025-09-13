import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/custom_snack_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/appointment/presentation/widgets/notes_section.dart';
import 'package:docdoc/features/appointment/presentation/widgets/selected_time_section.dart';
import 'package:docdoc/features/appointment/presentation/widgets/selection_date_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentViewBody extends StatefulWidget {
  const AppointmentViewBody({super.key, required this.doctorId});

  final int doctorId;

  @override
  State<AppointmentViewBody> createState() => _AppointmentViewBodyState();
}

class _AppointmentViewBodyState extends State<AppointmentViewBody> {
  String? date, time, note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(16),
          CustomAppBar(title: 'Reschedule'),
          HeightBox(24),
          SelectDateSection(
            selectDate: (date) => setState(() => this.date = date),
          ),
          HeightBox(24),
          SelectedTimeSection(
            selectTime: (time) => setState(() => this.time = time),
          ),
          HeightBox(24),
          NotesSection(notes: (comment) => setState(() => note = comment)),
          Expanded(child: HeightBox(24)),
          CustomButton(
            onTap: () {
              if (note != null) {
              } else {
                customSnackBar(
                  context: context,
                  message: 'Please add note or write (N/A)',
                  type: AnimatedSnackBarType.warning,
                );
              }
            },
            title: 'Reschedule',
          ),
          HeightBox(16),
        ],
      ),
    );
  }
}
