import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/widgets/custom_snack_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:docdoc/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:docdoc/features/auth/presentation/widgets/header_auth.dart';
import 'package:docdoc/features/auth/presentation/widgets/input_form_login.dart';
import 'package:docdoc/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }
        if (state is LoginLoaded) {
          customSnackBar(
            context: context,
            message: 'Hi ${state.user.name}, welcome back!',
            type: AnimatedSnackBarType.success,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.mainView,
            (route) => false,
          );
        } else if (state is LoginError) {
          Navigator.pop(context);
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeightBox(24),
              HeaderAuth(
                title: 'Welcome Back',
                subtitle:
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              ),
              HeightBox(36),
              InputFormLogin(),
              HeightBox(32),
              TermsAndConditions(),
              HeightBox(16),
              CustomRichText(
                text: 'Don\'t have an account? ',
                linkText: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.registerView);
                },
              ),
              HeightBox(24),
            ],
          ),
        ),
      ),
    );
  }
}
