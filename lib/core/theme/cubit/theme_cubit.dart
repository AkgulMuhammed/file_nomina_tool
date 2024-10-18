import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart'; // Doğru yol kullanımı

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void changeTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode)); // Parametre adı düzeltildi
  }
}
