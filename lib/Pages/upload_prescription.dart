import 'dart:io';

import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Controllers/PrescriptionControllers/prescription_controller.dart';
import 'package:dwa2y/Pages/full_photo.dart';
import 'package:dwa2y/Widgets/custom_button_prescription.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class UploadPrescription extends GetView<PrescriptionController> {
  const UploadPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Upload Prescription",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 4, 16, 89),
            Color.fromARGB(255, 1, 15, 57),
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonPrescription(text: "Delivery", onPressed: () {}),
                  CustomButtonPrescription(text: "Pickup", onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: controller.accountController.addresses.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text(
                                controller
                                    .accountController.addresses[0].streetName!,
                                style: GoogleFonts.roboto(color: Colors.white),
                              )),
                          TextButton(onPressed: () {}, child: const Text("Change")),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Select Address to deliver",
                              style: GoogleFonts.roboto(color: Colors.white),
                            ),
                          ),
                          TextButton(onPressed: () {}, child:const Text("Select")),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
