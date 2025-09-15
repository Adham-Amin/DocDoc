import 'package:docdoc/features/appointment/domain/entities/appointment_entity.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';

import 'doctor.dart';
import 'patient.dart';

class AppointmentResponse {
  int? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentTime;
  String? appointmentEndTime;
  String? status;
  String? notes;
  int? appointmentPrice;

  AppointmentResponse({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.appointmentPrice,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentResponse(
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

  AppointmentEntity toEntity() => AppointmentEntity(
    time: appointmentTime ?? '',
    notes: notes ?? '',
    doctor: DoctorEntity(
      address: doctor!.address ?? '',
      phone: doctor!.phone ?? '',
      email: doctor!.email ?? '',
      startTime: doctor!.startTime ?? '',
      endTime: doctor!.endTime ?? '',
      price: doctor!.appointPrice ?? 0,
      id: doctor!.id ?? 0,
      name: doctor!.name ?? '',
      speciality: doctor!.specialization?.name ?? '',
      city: doctor!.city?.name ?? '',
      governrate: doctor!.city?.governrate?.name ?? '',
      degree: doctor!.degree ?? '',
    ),
  );
}
