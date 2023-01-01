import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

class GenderScreen extends GetView<MyAccountController> {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Select Gender",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Constants().primaryColor.withOpacity(0.6),
                Constants().primaryColor.withOpacity(0.3),
              ]),
        ),
        child: GetX<MyAccountController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gender",style:GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500) ,),

                RadioListTile(
                    activeColor: Colors.white,
                    title: Text(
                      "Male",
                      style: GoogleFonts.roboto(color: Colors.white),
                    ),
                    value: "Male",
                    groupValue: controller.groupvalue.value,
                    onChanged: (value) {
                      controller.groupvalue.value = value.toString();
                    }),
                RadioListTile(
                  activeColor: Colors.white,
                    title: Text("Female",
                        style: GoogleFonts.roboto(color: Colors.white)),
                    value: "Female",
                    groupValue: controller.groupvalue.value,
                    onChanged: (value) {
                      controller.groupvalue.value = value.toString();
                    }),
                    Center(child: CustomElevatedButton(width: 150, height: 60, onPressed: (){
                      controller.updateType(controller.groupvalue.value);
                      Get.back();
                    }, text: "Save")),
              ],
                      ),
            );
          },
       
        ),
      ),
    );
  }
}
