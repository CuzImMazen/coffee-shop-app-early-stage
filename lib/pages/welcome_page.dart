import 'package:coffe_shop/Components/WelcomePage_Components/custom_button_welcomepage.dart';
import 'package:coffe_shop/Components/WelcomePage_Components/custom_subtext_welcomepage.dart';
import 'package:coffe_shop/Components/WelcomePage_Components/custom_text_welcomepage.dart';
import 'package:coffe_shop/pages/authentication_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /*Welcome Page body Has a  Main Column which contains
       a Stack to Display a Text intop of an Image  and  Some Texts and a Button*/
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 500,
                  child: Image.asset('assets/images/WelcomePhoto.jpg'),
                ),
              ),

              Positioned(
                top: 450,
                left: 50,
                child: CustomTextWelcomePage(text: "Fall in Love with"),
              ),
            ],
          ),
          SizedBox(height: 8),
          CustomTextWelcomePage(text: "Coffe in Blissful"),
          SizedBox(height: 8),
          CustomTextWelcomePage(text: "Delight!"),
          SizedBox(height: 16),
          CustomSubTextWelcomePage(
            text: 'Welcome to our cozy coffee corner, where',
          ),
          SizedBox(height: 8),
          CustomSubTextWelcomePage(text: "every cup is a delighful for you."),
          SizedBox(height: 40),
          CustomWelcomePageButton(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthenticationPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
