import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/widgets/custom_snack_bar.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:docdoc/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:docdoc/features/auth/presentation/widgets/header_auth.dart';
import 'package:docdoc/features/auth/presentation/widgets/input_form_register.dart';
import 'package:docdoc/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }
        if (state is RegisterLoaded) {
          customSnackBar(
            context: context,
            message: 'Hi ${state.user.name}, welcome back!',
            type: AnimatedSnackBarType.success,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.homeView,
            (route) => false,
          );
        } else if (state is RegisterError) {
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
                title: 'Create Account',
                subtitle:
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
              ),
              HeightBox(18),
              InputFormRegister(),
              HeightBox(32),
              TermsAndConditions(),
              HeightBox(16),
              CustomRichText(
                text: "Already have an account? ",
                linkText: 'Login',
                onTap: () {
                  Navigator.pop(context);
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
