import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startingApp();
    super.initState();
  }

  startingApp() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    navigateToHome();
  }

  navigateToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              RadialGradient(colors: [Color(0xFF36474F), Color(0xFF28353B)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 230 * MediaQuery.of(context).size.height / 740,
                width: 230 * MediaQuery.of(context).size.width / 360,
                child: Image.asset('assets/images/logo.png'),
              ),
              Text('Music',
                  style: TextStyle(
                      color: const Color(0xFFB92E3A),
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      fontFamily: GoogleFonts.poppins().fontFamily)),
              Text('Player',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily))
            ],
          ),
        ),
      ),
    );
  }
}
