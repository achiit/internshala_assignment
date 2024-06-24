import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the InternshipView after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      context.go('/internship');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
              width: 50,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/trust.svg",
                    height: Adaptive.w(
                      7.2,
                    ),
                    width: Adaptive.w(
                      7.2,
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                        textAlign: TextAlign.center,
                        "Trusted by over 21 Million College students & Graduates",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
