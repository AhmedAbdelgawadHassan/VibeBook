import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  bool get isDark => state == ThemeMode.dark;

  void toggle() {
    emit(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
