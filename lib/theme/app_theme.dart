import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData buildCustomTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kcPrimaryColor,
    colorScheme: base.colorScheme.copyWith(
      primary: kcPrimaryColor,
      secondary: kcPrimaryColorDark,
    ),
    textTheme: _buildTextTheme(base.textTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
    displayLarge: GoogleFonts.poppins(
      textStyle: base.displayLarge!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    displayMedium: GoogleFonts.poppins(
      textStyle: base.displayMedium!.copyWith(),
    ),
    displaySmall: GoogleFonts.poppins(
      textStyle: base.displaySmall!.copyWith(),
    ),
  )
      .apply(
    bodyColor: kcBlackColor,
    displayColor: kcBlackColor,
  );
}
