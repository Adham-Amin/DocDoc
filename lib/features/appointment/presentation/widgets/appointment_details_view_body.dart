import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:docdoc/features/appointment/presentation/widgets/book_information_section.dart';
import 'package:docdoc/features/appointment/presentation/widgets/check_booking.dart';
import 'package:docdoc/features/appointment/presentation/widgets/doctor_information_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetailsViewBody extends StatelessWidget {
  const AppointmentDetailsViewBody({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoaded) {
            return Column(
              children: [
                HeightBox(16),
                CustomAppBar(title: 'Details', isNavigate: false),
                HeightBox(32),
                CheckBooking(),
                HeightBox(48),
                BookInformationSection(
                  time: state.appointment.time,
                  note: state.appointment.notes,
                ),
                HeightBox(12),
                DoctorInformationSection(
                  image: image,
                  doctor: state.appointment.doctor,
                ),
                Expanded(child: HeightBox(24)),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.mainView,
                      (route) => false,
                    );
                  },
                  title: 'Done',
                ),
                HeightBox(16),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
