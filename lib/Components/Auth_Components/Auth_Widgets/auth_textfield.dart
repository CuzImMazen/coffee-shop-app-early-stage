import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.controller,
    this.validator,
  });
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator:
            validator ??
            (value) => value!.trim().isEmpty ? 'this field is required' : null,
        style: TextStyle(fontSize: 24, fontFamily: 'Sora', color: Colors.black),
        obscureText: obscureText,
        cursorColor: Color(0xff583d2a),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'Sora',
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff583d2a), width: 5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff583d2a), width: 5),
          ),
          prefixIcon: Icon(icon, color: Color(0xff583d2a)),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'Sora',
            color: Color(0xff583d2a),
          ),
        ),
      ),
    );
  }
}
