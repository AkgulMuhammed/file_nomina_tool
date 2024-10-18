import 'package:flutter/material.dart';
import 'package:filenominatool/core/theme/app_color.dart';
import 'package:filenominatool/core/theme/app_textstyle.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    primarySwatch: AppColor.primarySwatch,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColor.primarySwatch,
      brightness: Brightness.light, // Brightness uyumu eklendi
    ).copyWith(
      primary: AppColor.primaryColor,
      surface: AppColor.backgroundWhite,
    ),
    scaffoldBackgroundColor: AppColor.backgroundWhite,
    textTheme: TextTheme(
      displayLarge: AppTextStyle.instance.displayLarge,
      displayMedium: AppTextStyle.instance.displayMedium,
      displaySmall: AppTextStyle.instance.displaySmall,
      headlineLarge: AppTextStyle.instance.headlineLarge,
      headlineMedium: AppTextStyle.instance.headlineMedium,
      headlineSmall: AppTextStyle.instance.headlineSmall,
      titleLarge: AppTextStyle.instance.titleLarge,
      titleMedium: AppTextStyle.instance.titleMedium,
      titleSmall: AppTextStyle.instance.titleSmall,
      bodyLarge: AppTextStyle.instance.bodyLarge,
      bodyMedium: AppTextStyle.instance.bodyMedium,
      bodySmall: AppTextStyle.instance.bodySmall,
      labelLarge: AppTextStyle.instance.labelLarge,
      labelMedium: AppTextStyle.instance.labelMedium,
      labelSmall: AppTextStyle.instance.labelSmall,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actionsIconTheme: IconThemeData(color: AppColor.black),
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.white),
      titleTextStyle:
          AppTextStyle.instance.titleLarge.copyWith(color: AppColor.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    primarySwatch: AppColor.primarySwatch,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColor.primarySwatch,
      brightness: Brightness.dark, // Brightness uyumu eklendi
    ).copyWith(
      primary: AppColor.primaryColor,
      surface: AppColor.backgroundBlack,
    ),
    scaffoldBackgroundColor: AppColor.backgroundBlack,
    textTheme: TextTheme(
      displayLarge:
          AppTextStyle.instance.displayLarge.copyWith(color: AppColor.white),
      displayMedium:
          AppTextStyle.instance.displayMedium.copyWith(color: AppColor.white),
      displaySmall:
          AppTextStyle.instance.displaySmall.copyWith(color: AppColor.white),
      headlineLarge:
          AppTextStyle.instance.headlineLarge.copyWith(color: AppColor.white),
      headlineMedium:
          AppTextStyle.instance.headlineMedium.copyWith(color: AppColor.white),
      headlineSmall:
          AppTextStyle.instance.headlineSmall.copyWith(color: AppColor.white),
      titleLarge:
          AppTextStyle.instance.titleLarge.copyWith(color: AppColor.white),
      titleMedium:
          AppTextStyle.instance.titleMedium.copyWith(color: AppColor.white),
      titleSmall:
          AppTextStyle.instance.titleSmall.copyWith(color: AppColor.white),
      bodyLarge:
          AppTextStyle.instance.bodyLarge.copyWith(color: AppColor.white),
      bodyMedium:
          AppTextStyle.instance.bodyMedium.copyWith(color: AppColor.white),
      bodySmall:
          AppTextStyle.instance.bodySmall.copyWith(color: AppColor.white),
      labelLarge: AppTextStyle.instance.labelLarge
          .copyWith(color: AppColor.secondaryColor),
      labelMedium: AppTextStyle.instance.labelMedium
          .copyWith(color: AppColor.secondaryColor),
      labelSmall: AppTextStyle.instance.labelSmall
          .copyWith(color: AppColor.secondaryColor),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      actionsIconTheme: IconThemeData(color: AppColor.white),
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: AppTextStyle.instance.titleLarge
          .copyWith(color: AppColor.primaryColor),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
