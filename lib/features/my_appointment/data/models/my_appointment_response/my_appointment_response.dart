import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';

import 'doctor.dart';
import 'patient.dart';

class MyAppointmentResponse {
  int? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentTime;
  String? appointmentEndTime;
  String? status;
  String? notes;
  int? appointmentPrice;

  MyAppointmentResponse({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.appointmentPrice,
  });

  factory MyAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return MyAppointmentResponse(
      id: json['id'] as int?,
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentTime: json['appointment_time'] as String?,
      appointmentEndTime: json['appointment_end_time'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      appointmentPrice: json['appointment_price'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor': doctor?.toJson(),
    'patient': patient?.toJson(),
    'appointment_time': appointmentTime,
    'appointment_end_time': appointmentEndTime,
    'status': status,
    'notes': notes,
    'appointment_price': appointmentPrice,
  };

  MyAppointmentEntity toEntity() => MyAppointmentEntity(
    name: doctor!.name ?? '',
    speciality: doctor!.specialization!.name ?? '',
    degree: doctor!.degree ?? '',
    time: appointmentTime ?? '',
  );
}
