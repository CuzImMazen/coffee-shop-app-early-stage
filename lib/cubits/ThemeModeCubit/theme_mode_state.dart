part of 'theme_mode_cubit.dart';

@immutable
sealed class ThemeModeState {}

class LightMode extends ThemeModeState {}

class DarkMode extends ThemeModeState {}
