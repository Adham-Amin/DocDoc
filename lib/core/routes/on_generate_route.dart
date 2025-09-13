import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/features/appointment/presentation/view/appointment_view.dart';
import 'package:docdoc/features/auth/presentation/views/login_view.dart';
import 'package:docdoc/features/auth/presentation/views/register_view.dart';
import 'package:docdoc/features/doctor_detatils/presentation/view/deoctor_details_view.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/home/presentation/views/home_view.dart';
import 'package:docdoc/features/home/presentation/views/recommended_doctors_view.dart';
import 'package:docdoc/features/onbording/presentation/view/onbording_view.dart';
import 'package:docdoc/features/speciality/presentation/views/doctors_speciality_view.dart';
import 'package:docdoc/features/speciality/presentation/views/speciality_view.dart';
import 'package:docdoc/main_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.onbordingView:
      return MaterialPageRoute(builder: (_) => OnbordingView());
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (_) => LoginView());
    case AppRoutes.registerView:
      return MaterialPageRoute(builder: (_) => RegisterView());
    case AppRoutes.mainView:
      return MaterialPageRoute(builder: (_) => MainView());
    case AppRoutes.homeView:
      return MaterialPageRoute(builder: (_) => HomeView());
    case AppRoutes.doctorsSpecialityView:
      final arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => DoctorsSpecialityView(
          title: arguments['title'],
          specialityId: arguments['id'],
        ),
      );
    case AppRoutes.doctorDetailsView:
      final arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => DeoctorDetailsView(
          doctor: arguments['doctor'],
          image: arguments['image'],
        ),
      );
    case AppRoutes.recommendedDoctorsView:
      return MaterialPageRoute(
        builder: (_) => RecommendedDoctorsView(
          doctors: settings.arguments as List<DoctorEntity>,
        ),
      );
    case AppRoutes.appointmentView:
      return MaterialPageRoute(
        builder: (_) => AppointmentView(doctorId: settings.arguments as int),
      );
    case AppRoutes.specialityView:
      return MaterialPageRoute(builder: (_) => SpecialityView());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text("Route not found !"))),
      );
  }
}
