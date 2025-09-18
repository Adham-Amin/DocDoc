import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/features/appointment/presentation/view/appointment_details_view.dart';
import 'package:docdoc/features/appointment/presentation/view/appointment_view.dart';
import 'package:docdoc/features/auth/presentation/views/login_view.dart';
import 'package:docdoc/features/auth/presentation/views/register_view.dart';
import 'package:docdoc/features/doctor_detatils/presentation/view/deoctor_details_view.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/home/presentation/views/home_view.dart';
import 'package:docdoc/features/home/presentation/views/recommended_doctors_view.dart';
import 'package:docdoc/features/my_appointment/presentation/views/my_appointment_view.dart';
import 'package:docdoc/features/onbording/presentation/view/onbording_view.dart';
import 'package:docdoc/features/personal_info/presentation/views/personal_view.dart';
import 'package:docdoc/features/profile/presentation/views/profile_view.dart';
import 'package:docdoc/features/search/presentation/views/search_view.dart';
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
    case AppRoutes.myAppointmentView:
      return MaterialPageRoute(builder: (_) => MyAppointmentView());
    case AppRoutes.registerView:
      return MaterialPageRoute(builder: (_) => RegisterView());
    case AppRoutes.mainView:
      return MaterialPageRoute(builder: (_) => MainView());
    case AppRoutes.profileView:
      return MaterialPageRoute(builder: (_) => ProfileView());
    case AppRoutes.personalInfoView:
      return MaterialPageRoute(builder: (_) => PersonalView());
    case AppRoutes.homeView:
      return MaterialPageRoute(builder: (_) => HomeView());
    case AppRoutes.searchView:
      return MaterialPageRoute(builder: (_) => SearchView());
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
      final arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => AppointmentView(
          doctorId: arguments['doctorId'],
          image: arguments['image'],
        ),
      );
    case AppRoutes.appointmentDetailsView:
      return MaterialPageRoute(
        builder: (_) =>
            AppointmentDetailsView(image: settings.arguments as String),
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
