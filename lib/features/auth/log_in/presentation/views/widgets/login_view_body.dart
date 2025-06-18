import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/routes/routes.dart';
import 'package:nawel/core/theme/colors_manager.dart';
import 'package:nawel/core/utils/assets_manager.dart';
import 'package:nawel/core/widgets/custom_button.dart';
import 'package:nawel/core/widgets/custom_text_form_field.dart';
import 'package:nawel/features/auth/data/models/login/login_req_model.dart';
import 'package:nawel/features/auth/manager/bloc/auth_bloc.dart';
import 'package:nawel/features/auth/manager/bloc/auth_event.dart';
import 'package:nawel/features/auth/manager/bloc/auth_state.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        LoginEvent(
          LoginReqModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(child: Image.asset(AssetsManager.nawel)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: CustomTextFormField(
                controller: emailController,
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AssetsManager.mail),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: CustomTextFormField(
                controller: passwordController,
                isPassword: true,
                label: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AssetsManager.password),
                ),
              ),
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                onPressed: _onLoginPressed,
                text: 'Log in',
                color: ColorsManager.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.singUp);
              },
              child: const Text(
                'Create an account',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff1877f2),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}
