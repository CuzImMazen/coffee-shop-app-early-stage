import 'package:coffe_shop/Components/Auth_Components/Auth_Controllers/signin_controllers.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Controllers/signup_controllers.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/auth_tab.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/signin_window.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/signup_window.dart';
import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:coffe_shop/pages/main_page.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  static void listenAuthState(BuildContext context, AuthState state) {
    if (state is AuthFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
    if (state is AuthSignUpSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Text("SignUp Successful"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
    if (state is AuthSignInSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Text("SignIn Successful"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }

  static Widget buildAuthState(
    AuthState state,
    SignInController signInController,
    SignUpController signUpController,
    bool isSignInSelected,
    void Function() toggleTab,
  ) {
    if (state is AuthLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return Column(
      children: [
        SizedBox(height: 30),
        AuthTab(
          signInemailController: signInController.emailController,
          signInpasswordController: signInController.passwordController,
          signUpemailController: signUpController.emailController,
          signUppasswordController: signUpController.passwordController,
          sinUppasswordConfirmController:
              signUpController.confirmPasswordController,
          isSignInSelected: isSignInSelected,
          toggleTab: toggleTab,
        ),
        SizedBox(height: 30),

        //////////////////////////////////////////////////////
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: isSignInSelected
              ? SignInWindow(
                  emailController: signInController.emailController,
                  passwordController: signInController.passwordController,

                  key: ValueKey('SignIn'),
                  formKey: signInController.formKey,
                )
              : SignUpWindow(
                  emailController: signUpController.emailController,
                  passwordController: signUpController.passwordController,
                  passwordConfirmController:
                      signUpController.confirmPasswordController,
                  key: ValueKey('SignUp'),
                  formKey: signUpController.formKey,
                ),
          transitionBuilder: (child, animation) => SlideTransition(
            position: Tween(
              begin: isSignInSelected ? Offset(-1, 0) : Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ],
    );
  }
}
