import 'dart:io';

import 'package:dwa2y/Controllers/PrescriptionControllers/prescription_controller.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GetX<PrescriptionController>(
                builder: (controller) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(0.3)),
                    child: controller.pickedImage.value.isNotEmpty
                        ? InkWell(
                          onTap: (){

                          },
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.file(
                                    File(controller.pickedImage.value))))
                        : InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Pick Prescription From",
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomElevatedButton(
                                          width: 200,
                                          height: 60,
                                          onPressed: () {
                                            controller
                                                .pickPrescriptionFromGallery();
                                                Get.back();
                                          },
                                          text: "Pick From Gallery"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomElevatedButton(
                                          width: 200,
                                          height: 60,
                                          onPressed: () {
                                              Get.back();
                                          },
                                          text: "Pick From Camera"),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            )),
                  );
                },
              ),
  

            ],
          ),
        ),
      ),
    );
  }
}
