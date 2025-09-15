import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/custom_snack_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:docdoc/features/appointment/presentation/view/appointment_details_view.dart';
import 'package:docdoc/features/appointment/presentation/widgets/notes_section.dart';
import 'package:docdoc/features/appointment/presentation/widgets/selected_time_section.dart';
import 'package:docdoc/features/appointment/presentation/widgets/selection_date_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentViewBody extends StatefulWidget {
  const AppointmentViewBody({
    super.key,
    required this.doctorId,
    required this.image,
  });

  final int doctorId;
  final String image;

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
          BlocListener<AppointmentCubit, AppointmentState>(
            listener: (context, state) {
              if (state is AppointmentLoaded) {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<AppointmentCubit>(),
                      child: AppointmentDetailsView(image: widget.image),
                    ),
                  ),
                );
              }

              if (state is AppointmentError) {
                customSnackBar(
                  context: context,
                  message: state.message,
                  type: AnimatedSnackBarType.error,
                );
              }
              if (state is AppointmentLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              }
            },
            child: CustomButton(
              onTap: () {
                if (note != null) {
                  context.read<AppointmentCubit>().bookAppointment(
                    doctorId: widget.doctorId,
                    appointmentTime: '$date $time',
                    notes: note!,
                  );
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
          ),
          HeightBox(16),
        ],
      ),
    );
  }
}
