import 'package:e_com_app/constants/Appassets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle heading1 = TextStyle(
    color: AppAssets.grey,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    // Add more style properties as needed
  );

  static TextStyle bodyText = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 16,
    // Add more style properties as needed
  );
}
