import 'package:dwa2y/Controllers/AuthRepositories/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.currentUserData.value.lat);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: GetX<HomeController>(
          builder: (controller) {
            return Text(
                "Welcome ${controller.currentUserData.value.username}, ",
                style: GoogleFonts.ubuntu(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white));
          },
        ),
        backgroundColor:  const Color.fromARGB(255, 1, 15, 57),
        elevation: 0,
      ),
      body: Container(
        decoration: const  BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 Color.fromARGB(255, 4, 16, 89),
                    Color.fromARGB(255, 1, 15, 57),
              ]),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GridView.count(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.all(20),
            crossAxisCount: 2,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 4, 16, 89),
                    Color.fromARGB(255, 1, 15, 57),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/prescriptionIcon.png"),
                      radius: 30,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Upload Prescription",
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 4, 16, 89),
                    Color.fromARGB(255, 1, 15, 57),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/order.png"),
                      radius: 30,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "View my Orders",
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 4, 16, 89),
                    Color.fromARGB(255, 1, 15, 57),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/pharmacyPlace.png"),
                      radius: 30,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      " Nearby Pharmacies",
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 4, 16, 89),
                    Color.fromARGB(255, 1, 15, 57),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/patient.png"),
                      radius: 30,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Request Help",
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
