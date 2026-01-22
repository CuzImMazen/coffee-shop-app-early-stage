import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    required this.text,
    required this.formKey,
    required this.email,
    required this.password,
    this.confirmPassword,
    required this.onTap,
  });
  final String text;
  final GlobalKey<FormState> formKey;
  final String email;
  final String password;
  final String? confirmPassword;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 6, spreadRadius: 0.5),
          ],

          borderRadius: BorderRadius.circular(50),
          color: Color(0xff583d2a),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Sora',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
