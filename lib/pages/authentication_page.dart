import 'package:coffe_shop/Components/Auth_Components/Auth_Controllers/signin_controllers.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Controllers/signup_controllers.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Helpers/auth_methods.dart';
import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/auth_background_image.dart';
import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final SignInController signInController = SignInController();
  final SignUpController signUpController = SignUpController();

  // Method that Check Wich AuthWindow is selected (SinIn-SignUp) and rebuild with setstate
  bool isSignInSelected = true;
  void toggleTab() {
    setState(() {
      isSignInSelected = !isSignInSelected;
    });
  }

  // dispposing Controllers
  @override
  void dispose() {
    signInController.dispose();
    signUpController.dispose();
    super.dispose();
  }

  //Providing the AuthCubit for AuthPage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99765f),
      body: Stack(
        children: [
          // #1
          BackGroundImage(),

          // #2
          Positioned(
            top: 380 - MediaQuery.of(context).viewInsets.bottom,
            child: Container(
              height: MediaQuery.of(context).size.height,

              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                color: Color(0xff99765f),
              ),

              //Handling Container State
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  AuthMethods.listenAuthState(context, state);
                },

                builder: (context, state) {
                  return AuthMethods.buildAuthState(
                    state,
                    signInController,
                    signUpController,
                    isSignInSelected,
                    toggleTab,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
