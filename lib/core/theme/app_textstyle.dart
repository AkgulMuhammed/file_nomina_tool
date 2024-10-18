import 'package:filenominatool/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle displayLarge = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 57,
    fontWeight: FontWeight.bold,
  );

  TextStyle displayMedium = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );

  TextStyle displaySmall = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );

  TextStyle headlineLarge = GoogleFonts.raleway(
    color: AppColor.primaryColor,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  TextStyle headlineMedium = GoogleFonts.raleway(
    color: AppColor.primaryColor,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  TextStyle headlineSmall = GoogleFonts.raleway(
    color: AppColor.primaryColor,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  TextStyle titleLarge = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  TextStyle titleMedium = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  TextStyle titleSmall = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  TextStyle labelLarge = GoogleFonts.raleway(
    color: AppColor.secondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  TextStyle labelMedium = GoogleFonts.raleway(
    color: AppColor.secondaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  TextStyle labelSmall = GoogleFonts.raleway(
    color: AppColor.secondaryColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  TextStyle bodyLarge = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  TextStyle bodyMedium = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  TextStyle bodySmall = GoogleFonts.raleway(
    color: AppColor.blackGrey,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}
