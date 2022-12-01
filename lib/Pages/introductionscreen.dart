import 'package:dwa2y/Controllers/AuthRepositories/location_controller.dart';
import 'package:dwa2y/Pages/AuthPages/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends GetView<LocationController> {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IntroductionScreen(
       
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blueAccent,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: GoogleFonts.roboto(),
        ),
        done: Text(
          "Done ",
          style: GoogleFonts.roboto(),
        ),
        next: Text("Next", style: GoogleFonts.roboto()),
        onDone: () {
         Get.offAll(()=>const SignInScreen());
        },
        pages: [
          PageViewModel(
            titleWidget: Text(
              "Dwa2y",
              style: GoogleFonts.lobster(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 0.8),
            ),
            body:
              "Our App Serves you to get your perception's medicine  as soon as possible",
        
            image: Center(
              child: Image.asset(
                "assets/images/Prescription.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          PageViewModel(
             titleWidget: Text(
              "Dwa2y",
              style: GoogleFonts.lobster(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 0.8),
            ),
            body: "Upload your perscription and let pharmacies do the rest ",
            image: Center(
              child: Image.asset('assets/images/Prescription2.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
