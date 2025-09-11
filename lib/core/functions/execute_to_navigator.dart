import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/services/shared_preferences_service.dart';

String executeToNavigator() {
  final seenOnboarding = Prefs.getBool('seenOnboarding');
  final user = Prefs.getUser();

  if (!seenOnboarding) return AppRoutes.onbordingView;
  return user != null ? AppRoutes.homeView : AppRoutes.loginView;
}
