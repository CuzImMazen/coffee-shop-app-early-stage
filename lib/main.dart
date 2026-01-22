import 'package:coffe_shop/cubits/AuthCubit/auth_cubit.dart';
import 'package:coffe_shop/cubits/FavoriteCubit/favorite_cubit.dart';
import 'package:coffe_shop/cubits/ThemeModeCubit/theme_mode_cubit.dart';
import 'package:coffe_shop/pages/main_page.dart';
import 'package:coffe_shop/pages/welcome_page.dart';
import 'package:coffe_shop/services/favorites_service.dart';
import 'package:coffe_shop/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Environment variables (safe for GitHub)
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  // Ensure keys exist
  if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
    throw Exception('Supabase credentials are missing');
  }

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  final authCubit = AuthCubit();
  final themeCubit = ThemeModeCubit();

  await authCubit.checkIfUserIsLoggedIn();
  await themeCubit.getThemeMode();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FavoriteCubit(FavoritesService(), ProductService());
          },
        ),
        BlocProvider.value(value: authCubit),
        BlocProvider.value(value: themeCubit),
      ],
      child: const CoffeShop(),
    ),
  );
}

class CoffeShop extends StatelessWidget {
  const CoffeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
      builder: (context, themeState) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            return MaterialApp(
              theme: themeState is LightMode
                  ? ThemeData.light()
                  : ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              home: authState is AuthSignInSuccess ? MainPage() : WelcomePage(),
            );
          },
        );
      },
    );
  }
}
