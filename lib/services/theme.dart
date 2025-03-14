import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xff2B637B),
    onPrimary: Color(0xffFFFFFF),
    surface: Color(0xffFFFFFF),
    onSurface: Color(0xff04021D),
    // error: Color(0xffFF5539),
    // onError: Color(0xffEFFFFB),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
    displayMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
    displaySmall: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
    headlineLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
    headlineMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
    headlineSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
    titleLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
    titleSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
    bodyLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
    ),
    bodyMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
    ),
    bodySmall: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
    ),
    labelLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
    labelMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
    labelSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  // dividerColor: Colors.transparent,
);

// ThemeData darkMode = ThemeData(
//   useMaterial3: true,
//   brightness: Brightness.dark,
//   colorScheme: const ColorScheme.dark(
//     primary: Color(0xff1289B4),
//     secondary: Color(0xffCE4919),
//     onPrimary: Color(0xffEFFFFB),
//     onSecondary: Color(0xffEFFFFB),
//     surface: Color(0xff121212),
//     onSurface: Color(0xffEFFFFB),
//     // error: Color(0xffF12200),
//     // onError: Color(0xffEFFFFB),
//   ),
//   textTheme: TextTheme(
//     displayLarge: GoogleFonts.outfit(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     displayMedium: GoogleFonts.outfit(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     displaySmall: GoogleFonts.outfit(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     headlineLarge: GoogleFonts.outfit(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     headlineMedium: GoogleFonts.outfit(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     headlineSmall: GoogleFonts.outfit(
//       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//     ),
//     titleLarge: GoogleFonts.italiana(
//       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//     ),
//     titleMedium: GoogleFonts.italiana(
//       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//     ),
//     titleSmall: GoogleFonts.italiana(
//       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//     ),
//     bodyLarge: GoogleFonts.spaceGrotesk(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     bodyMedium: GoogleFonts.spaceGrotesk(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     bodySmall: GoogleFonts.spaceGrotesk(
//       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//     ),
//     labelLarge: GoogleFonts.spaceGrotesk(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     labelMedium: GoogleFonts.spaceGrotesk(
//       textStyle: const TextStyle(fontWeight: FontWeight.normal),
//     ),
//     labelSmall: GoogleFonts.spaceGrotesk(
//       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//     ),
//   ),
//   // dividerColor: Colors.transparent,
// );
