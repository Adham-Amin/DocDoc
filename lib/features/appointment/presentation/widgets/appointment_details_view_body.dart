import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/doctor_card.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
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

class DoctorInformationSection extends StatelessWidget {
  const DoctorInformationSection({
    super.key,
    required this.image,
    required this.doctor,
  });

  final String image;
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Doctor Information', style: AppStyles.textSemiBold16),
        HeightBox(24),
        DoctorCard(navigate: false, doctor: doctor, image: image),
      ],
    );
  }
}

class CheckBooking extends StatelessWidget {
  const CheckBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65.h,
          width: 65.w,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Icon(Icons.check_outlined, color: AppColors.white, size: 32.r),
        ),
        HeightBox(24),
        Text(
          'Booking has been\nrescheduled',
          style: AppStyles.textBold18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class BookInformationSection extends StatelessWidget {
  const BookInformationSection({
    super.key,
    required this.time,
    required this.note,
  });

  final String time;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Booking Information', style: AppStyles.textSemiBold16),
        HeightBox(16),
        CustomListTile(
          color: Color(0xff247CFF),
          icon: Icons.date_range,
          title: 'Date & Time',
          subtitle: time,
        ),
        CustomListTile(
          color: Color(0xff22C55E),
          icon: Icons.person,
          title: 'Notes',
          subtitle: note,
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          title: Text(title, style: AppStyles.textSemiBold14),
          subtitle: Text(
            subtitle,
            style: AppStyles.textRegular12.copyWith(color: AppColors.grey),
          ),
        ),
        Divider(
          thickness: 1.h,
          color: AppColors.grey.withValues(alpha: 0.25),
          height: 24.h,
        ),
      ],
    );
  }
}
