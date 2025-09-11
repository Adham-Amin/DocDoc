import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/auth/data/models/login_request/login_request.dart';
import 'package:docdoc/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputFormLogin extends StatefulWidget {
  const InputFormLogin({super.key});

  @override
  State<InputFormLogin> createState() => _InputFormLoginState();
}

class _InputFormLoginState extends State<InputFormLogin> {
  bool isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          HeightBox(16),
          CustomTextFormField(
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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot Password?',
              style: AppStyles.textRegular12.copyWith(color: AppColors.primary),
            ),
          ),
          HeightBox(32),
          CustomButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<LoginCubit>().login(
                  data: LoginRequest(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            title: 'Login',
          ),
        ],
      ),
    );
  }
}
