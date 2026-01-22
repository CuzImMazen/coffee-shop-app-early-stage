import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/auth_textfield.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/custom_button_authpage.dart';
import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWindow extends StatelessWidget {
  const SignUpWindow({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            controller: emailController,
            hintText: "Email",
            icon: Icons.email,
            obscureText: false,
          ),

          ////////////////////////////////////////////////////////
          SizedBox(height: 20),
          AuthTextField(
            controller: passwordController,
            hintText: "Password",
            icon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(height: 20),

          //////////////////////////////////////////////////////////
          AuthTextField(
            validator: (value) {
              if (value != passwordController.text &&
                  passwordController.text.isNotEmpty) {
                return 'Passwords do not match';
              }
              return null;
            },
            controller: passwordConfirmController,
            hintText: "Confirm Password",
            icon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(height: 30),
          CustomAuthButton(
            text: "Sign Up",
            formKey: formKey,
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            confirmPassword: passwordConfirmController.text.trim(),
            onTap: () {
              if (formKey.currentState!.validate()) {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                BlocProvider.of<AuthCubit>(
                  context,
                ).signUp(email, password, context);
              }
            },
          ),
        ],
      ),
    );
  }
}
