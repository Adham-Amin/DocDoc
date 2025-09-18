import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';
import 'package:docdoc/features/my_appointment/presentation/cubit/my_appointment_cubit.dart';
import 'package:docdoc/features/my_appointment/presentation/widgets/my_appointment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyApoointmentList extends StatelessWidget {
  const MyApoointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MyAppointmentCubit, MyAppointmentState>(
        builder: (context, state) {
          if (state is MyAppointmentLoaded) {
            return ListView.separated(
              itemCount: state.myAppointments.length,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => HeightBox(16),
              itemBuilder: (context, index) => MyAppointmentItem(
                image: DoctorEntity
                    .doctorImages[index % DoctorEntity.doctorImages.length],
                myAppointment: state.myAppointments[index],
              ),
            );
          } else if (state is MyAppointmentError) {
            return Center(child: Text(state.message));
          } else if (state is MyAppointmentLoading) {
            return Skeletonizer(
              child: ListView.separated(
                itemCount: 4,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => HeightBox(16),
                itemBuilder: (context, index) => MyAppointmentItem(
                  image: DoctorEntity
                      .doctorImages[index % DoctorEntity.doctorImages.length],
                  myAppointment: MyAppointmentEntity(
                    name: 'Dr. Randy Wigham',
                    speciality: 'Dentist',
                    degree: 'MBBS, MD',
                    time: 'Saturday, October 18, 2025 4:00 PM',
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
