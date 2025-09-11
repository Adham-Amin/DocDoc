import 'package:docdoc/core/di/service_locator.dart';
import 'package:docdoc/core/functions/execute_to_navigator.dart';
import 'package:docdoc/core/routes/on_generate_route.dart';
import 'package:docdoc/core/services/custom_observer_bloc.dart';
import 'package:docdoc/core/services/shared_preferences_service.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await serverLocator();
  Bloc.observer = CustomObserverBloc();
  runApp(const DocDoc());
}

class DocDoc extends StatelessWidget {
  const DocDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.interTextTheme(),
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.white,
        ),
        initialRoute: executeToNavigator(),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
