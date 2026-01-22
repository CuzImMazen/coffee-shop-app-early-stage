import 'package:coffe_shop/MainPageBodies/cart_body.dart';
import 'package:coffe_shop/MainPageBodies/favorite_body.dart';
import 'package:coffe_shop/MainPageBodies/home_body.dart';
import 'package:coffe_shop/Components/MainPage_Components/Widgets/navigationbar_button.dart';
import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:coffe_shop/pages/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AuthenticationPage()),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff99765f)),
          );
        }
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) =>
                  setState(() => selectedIndex = value),
              indicatorColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              destinations: [
                NavigationBarButton(
                  icon: Icon(IconlyLight.home),
                  label: 'Home',
                  color: Color(0xffc87b4b),
                  selectedIcon: IconlyBold.home,
                ),
                NavigationBarButton(
                  icon: Icon(IconlyLight.heart),
                  label: 'Favourites',
                  color: Color(0xffc87b4b),
                  selectedIcon: IconlyBold.heart,
                ),

                NavigationBarButton(
                  icon: Icon(IconlyLight.bag),
                  label: 'Cart',
                  color: Color(0xffc87b4b),
                  selectedIcon: IconlyBold.bag,
                ),
                NavigationBarButton(
                  icon: Icon(IconlyLight.profile),
                  label: 'Profile',
                  color: Color(0xffc87b4b),
                  selectedIcon: IconlyBold.profile,
                ),
              ],
            ),
          ),
          body: switch (selectedIndex) {
            0 => const HomeBody(),
            1 => const FavoriteBody(),
            2 => const CartBody(),
            3 => const Center(child: Text("Profile Page")),
            _ => Container(),
          },
        );
      },
    );
  }
}
