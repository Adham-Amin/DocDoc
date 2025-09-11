import 'package:docdoc/core/widgets/custom_button.dart';
import 'package:docdoc/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/auth/data/models/register_request/register_request.dart';
import 'package:docdoc/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputFormRegister extends StatefulWidget {
  const InputFormRegister({super.key});

  @override
  State<InputFormRegister> createState() => _InputFormLoginState();
}

class _InputFormLoginState extends State<InputFormRegister> {
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
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Name',
            controller: nameController,
            keyboardType: TextInputType.name,
            validator: (name) =>
                name == null || name.isEmpty ? 'Please enter your name' : null,
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
          HeightBox(32),
          CustomButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<RegisterCubit>().register(
                  data: RegisterRequest(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    confirmPassword: confirmPassController.text,
                    phone: phoneController.text,
                    gender: 0,
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
        ],
      ),
    );
  }
}
