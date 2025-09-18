import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:docdoc/core/routes/app_routes.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/custom_snack_bar.dart';
import 'package:docdoc/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/personal_info/data/models/personal_request.dart';
import 'package:docdoc/features/personal_info/presentation/cubit/personal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalViewBody extends StatefulWidget {
  const PersonalViewBody({super.key});

  @override
  State<PersonalViewBody> createState() => _PersonalViewBodyState();
}

class _PersonalViewBodyState extends State<PersonalViewBody> {
  bool isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController nameController,
      emailController,
      passwordController,
      phoneController,
      confirmPassController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonalCubit, PersonalState>(
      listener: (context, state) {
        if (state is PersonalLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }
        if (state is PersonalError) {
          Navigator.pop(context);
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
        if (state is PersonalLoaded) {
          Navigator.pop(context);
          customSnackBar(
            context: context,
            message: 'Personal info updated successfully!',
            type: AnimatedSnackBarType.success,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.loginView,
            (route) => false,
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                HeightBox(16),
                CustomAppBar(title: 'Personal Info'),
                HeightBox(32),
                CustomTextFormField(
                  hintText: 'Name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (name) => name == null || name.isEmpty
                      ? 'Please enter your name'
                      : null,
                ),
                HeightBox(16),
                CustomTextFormField(
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(email)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                HeightBox(16),
                CustomTextFormField(
                  validator: (pass) {
                    if (pass == null || pass.isEmpty) {
                      return 'Please enter your password';
                    } else if (pass.length < 6 &&
                        !RegExp(
                          r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
                        ).hasMatch(pass)) {
                      return 'Password must be at least 6 characters long and contain at least one letter and one number';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: isObscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: isObscure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                HeightBox(16),
                CustomTextFormField(
                  validator: (pass) {
                    if (pass != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  controller: confirmPassController,
                  hintText: 'Confirm Password',
                  obscureText: isObscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: isObscure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                HeightBox(16),
                CustomTextFormField(
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return 'Please enter your phone';
                    } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(phone)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  controller: phoneController,
                  hintText: 'Phone',
                  keyboardType: TextInputType.number,
                ),
                HeightBox(24),
                Text(
                  'When you set up your personal information settings, you should take care to provide accurate information.',
                  style: AppStyles.textRegular12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                HeightBox(32),
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<PersonalCubit>().updatePersonalInfo(
                        personalRequest: PersonalRequest(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPassController.text,
                          phone: phoneController.text,
                          gender: '0',
                        ),
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  title: 'Create Account',
                ),
                HeightBox(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
