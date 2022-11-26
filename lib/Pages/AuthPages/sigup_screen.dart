import 'dart:developer';
import 'dart:io';

import 'package:dwa2y/Constants/constants.dart';
import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Pages/AuthPages/verification_phone.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:dwa2y/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignUpScreen extends GetView<AuthServices> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Create Account  ",
              style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          leading: const BackButton(color: Colors.white),
          backgroundColor: Constants().primaryColor.withOpacity(0.6),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Constants().primaryColor.withOpacity(0.6),
                    Constants().primaryColor.withOpacity(0.3),
                  ]),
            ),
            child: GetX<AuthServices>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Form(
                      key: controller.formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 0),
                                    title: Text(
                                      "Customer",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white),
                                    ),
                                    value: "Customer",
                                    activeColor: Colors.white,
                                    groupValue: controller.groupValue.value,
                                    onChanged: (value) {
                                      controller.groupValue.value =
                                          value.toString();
                                      controller.profileImagePath.value = "";
                                    }),
                              ),
                              Expanded(
                                child: RadioListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Text(
                                      "Pharmacy",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white),
                                    ),
                                    activeColor: Colors.white,
                                    value: "Pharmacy",
                                    groupValue: controller.groupValue.value,
                                    onChanged: (value) {
                                      controller.groupValue.value =
                                          value.toString();
                                      controller.profileImagePath.value = "";
                                    }),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      controller.profileImagePath.value != ""
                                          ? Image.file(File(controller
                                                  .profileImagePath.value
                                                  .toString()))
                                              .image
                                          : controller.groupValue.value ==
                                                  "Customer"
                                              ? const AssetImage(
                                                  "assets/images/patient.png")
                                              : const AssetImage(
                                                  "assets/images/pharmacy.png"),
                                  radius: 30,
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                        onTap: () {
                                          controller.pickprofileImage();
                                        },
                                        child: const Icon(
                                            FontAwesomeIcons.circlePlus,
                                            color: Color.fromARGB(
                                                255, 1, 16, 43)))),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          customTextField(
                            hintText: "username",
                            controller: controller.usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter correct Username";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IntlPhoneField(
                            showCountryFlag: true,
                            controller: controller.phoneController,
                            initialCountryCode: controller.countrycode.value,
                            onCountryChanged: (value) {
                              controller.dialCode.value=value.dialCode;
                              controller.countrycode.value = value.dialCode;
                            },
                            style: GoogleFonts.roboto(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Phone",
                              counterStyle:
                                  GoogleFonts.roboto(color: Colors.white),
                              hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.white)),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customTextField(
                            hintText: "Password",
                            controller: controller.passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter correct password";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customTextField(
                            hintText: "ConfirmPassword",
                            controller: controller.confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter correct password";
                              } else {
                                if (controller.passwordController.text .toString() != value) {
                                  return "passwords don't match";
                                }
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customElevatedButton(
                              width: width,
                              height: height * 0.4,
                              onPressed: () async{
                                if (controller.formkey.currentState!.validate()) {
                                  String phone=controller.dialCode.value+controller.phoneController.text;
                                  controller.authenticateWithPhone(phone);
                                  Get.to(() =>  VerificationPhone());
                                }
                              },
                              text: "Sign Up"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already Have an Account? ",
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 14),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text("Login",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
