import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Are you sure",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: 'Sora',
        ),
      ),
      content: Text(
        "Do you want to logout?",
        style: TextStyle(fontSize: 20, fontFamily: 'Sora'),
      ),
      actions: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 20, fontFamily: 'Sora'),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await context.read<AuthCubit>().signOut();
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Sora',
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
