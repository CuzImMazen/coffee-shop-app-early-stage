import 'package:coffe_shop/Components/HomeBody_Components/Widgets/logout_dialog.dart';
import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:coffe_shop/cubits/FavoriteCubit/favorite_cubit.dart';
import 'package:coffe_shop/cubits/ThemeModeCubit/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyTopContainer extends StatelessWidget {
  const HomeBodyTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey[800]!],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sora",
                  ),
                ),
                Spacer(),

                IconButton(
                  onPressed: () {
                    context.read<ThemeModeCubit>().changeThemeMode();
                  },
                  icon: Icon(Icons.dark_mode),
                ),
                IconButton(
                  onPressed: () async {
                    context.read<FavoriteCubit>().resetFavorites();
                    showDialog(
                      context: context,
                      builder: (context) => SignOutDialog(),
                    );
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              context.read<AuthCubit>().user.email ?? "User",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Sora",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
