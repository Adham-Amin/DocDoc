import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';

class AppointmentEntity {
  final String time;
  final String notes;
  final DoctorEntity doctor;

  AppointmentEntity({
    required this.time,
    required this.notes,
    required this.doctor,
  });
}
