import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void toggleTheme() {
    switch (state.themeMode) {
      case ThemeMode.light:
        emit(state.copyWith(themeMode: ThemeMode.dark));
        break;
      case ThemeMode.dark:
        emit(state.copyWith(themeMode: ThemeMode.light));
        break;
      case ThemeMode.system:
        // TODO: Handle system mode
        log('$ThemeMode is not supported for toggling');
        break;
    }
  }

  void setTheme(ThemeMode mode) => emit(state.copyWith(themeMode: mode));
}
