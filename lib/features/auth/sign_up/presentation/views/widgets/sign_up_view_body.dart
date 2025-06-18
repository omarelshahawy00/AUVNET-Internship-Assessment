import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nawel/core/theme/colors_manager.dart';
import 'package:nawel/core/utils/assets_manager.dart';
import 'package:nawel/core/utils/my_validators.dart';
import 'package:nawel/core/widgets/custom_button.dart';
import 'package:nawel/core/widgets/custom_text_form_field.dart';
import 'package:nawel/features/auth/data/models/sign_up/signup_req_model.dart';
import 'package:nawel/features/auth/manager/bloc/auth_bloc.dart';
import 'package:nawel/features/auth/manager/bloc/auth_event.dart';
import 'package:nawel/features/auth/manager/bloc/auth_state.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        SignupEvent(
          SignupReqModel(
            email: emailController.text.trim(),
            name: nameController.text,
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
                controller: nameController,
                label: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.person_outline_sharp,
                    color: Color(0xffacacac),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: CustomTextFormField(
                controller: emailController,
                label: 'Email',
                validator: MyValidators.emailValidator,
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
                validator: MyValidators.passwordValidator,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AssetsManager.password),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: CustomTextFormField(
                controller: confirmPasswordController,
                isPassword: true,
                label: 'Confirm Password',
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
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
                onPressed: () => _onSignUpPressed(context),
                text: 'Sign Up',
                color: ColorsManager.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Already have an account? Log in',
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
