import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';
import '../Controllers/PrescriptionControllers/prescription_controller.dart';

class FullPhoto extends GetView<PrescriptionController> {
  const FullPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Prescription",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
              onTap: () {
                controller.pickedImage.value = '';
                Get.back();
              },
              child: const Icon(Icons.delete)),
        ],
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 4, 16, 89),
            Color.fromARGB(255, 1, 15, 57),
          ]),
        ),
        child: Hero(
            tag: "enlargephoto",
            child: Image.file(File(controller.pickedImage.value))),
      ),
    );
  }
}
