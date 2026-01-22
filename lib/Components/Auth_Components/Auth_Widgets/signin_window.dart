import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/auth_textfield.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/custom_button_authpage.dart';
import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWindow extends StatelessWidget {
  const SignInWindow({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

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
          SizedBox(height: 20),
          AuthTextField(
            controller: passwordController,
            hintText: "Password",
            icon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(height: 60),
          CustomAuthButton(
            text: "Sign In",
            formKey: formKey,
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            onTap: () async {
              if (formKey.currentState!.validate()) {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                await BlocProvider.of<AuthCubit>(
                  context,
                ).signIn(email, password, context);
              }
            },
          ),
        ],
      ),
    );
  }
}
