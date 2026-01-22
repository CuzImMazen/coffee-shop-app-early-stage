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
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

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
      child: CoffeShop(),
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
