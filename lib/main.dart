import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              headline2: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
              headline3: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
              bodyText1: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12)),
          iconTheme: const IconThemeData(color: Colors.white)),
      home: const SplashScreen(),
    );
  }
}
