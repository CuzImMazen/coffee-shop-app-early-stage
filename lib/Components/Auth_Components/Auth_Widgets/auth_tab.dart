import 'package:coffe_shop/Components/Auth_Components/Auth_Widgets/custom_text_authTab.dart';
import 'package:flutter/material.dart';

class AuthTab extends StatelessWidget {
  const AuthTab({
    required this.isSignInSelected,
    required this.toggleTab,
    required this.signInemailController,
    required this.signInpasswordController,
    required this.signUpemailController,
    required this.signUppasswordController,
    required this.sinUppasswordConfirmController,
  });

  final bool isSignInSelected;
  final Function toggleTab;
  final TextEditingController signInemailController;
  final TextEditingController signInpasswordController;
  final TextEditingController signUpemailController;
  final TextEditingController signUppasswordController;
  final TextEditingController sinUppasswordConfirmController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //SignIn
        GestureDetector(
          onTap: () {
            signUpemailController.clear();
            signUppasswordController.clear();
            sinUppasswordConfirmController.clear();

            if (isSignInSelected != true) {
              toggleTab();
            }
          },
          child: isSignInSelected
              ? CustomTabText(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  text: "Sign In",
                )
              : CustomTabText(
                  color: Colors.white.withAlpha(150),
                  fontWeight: FontWeight.normal,
                  text: "Sign In",
                ),
        ),
        SizedBox(width: 70),

        ////////////////////////////////////////////////////////////////////////////

        //SignUp
        GestureDetector(
          onTap: () {
            signInemailController.clear();
            signInpasswordController.clear();
            if (isSignInSelected == true) {
              toggleTab();
            }
          },
          child: isSignInSelected
              ? CustomTabText(
                  text: "Sign Up",
                  color: Colors.white.withAlpha(150),
                  fontWeight: FontWeight.normal,
                )
              : CustomTabText(
                  text: "Sign Up",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ],
    );
  }
}
