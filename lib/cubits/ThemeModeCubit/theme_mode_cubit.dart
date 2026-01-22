import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(LightMode());

  void changeThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state is LightMode) {
      await prefs.setBool('isDarkMode', true);
      emit(DarkMode());
    } else {
      await prefs.setBool('isDarkMode', false);
      emit(LightMode());
    }
  }

  Future<void> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isDarkMode') == true) {
      emit(DarkMode());
    } else {
      emit(LightMode());
    }
  }
}
