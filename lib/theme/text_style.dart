import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:try_fit/core/imports/external_imports.dart';

import 'app_colors.dart';

TextStyle getBoldStyle({
  Color color = kcBlackColor,
  double fontSize = 24,
  FontWeight fontWeight = FontWeight.w700,
}) {
  return GoogleFonts.duruSans(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: -0.5,
      wordSpacing: -0.5);
}

TextStyle getRegularBoldStyle({
  Color color = kcBlackColor,
  double fontSize = 24,
  FontWeight fontWeight = FontWeight.w600,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getMediumStyle({
  Color color = kcBlackColor,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle({
  Color color = kcBlackColor,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize.sp,
    color: color,
    letterSpacing: -0.5,
    fontWeight: fontWeight,
  );
}
