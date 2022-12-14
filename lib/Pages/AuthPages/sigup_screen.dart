import 'dart:io';

import 'package:dwa2y/Constants/constants.dart';
import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Widgets/custom_text_field.dart';

class SignUpScreen extends GetView<AuthServices> {
   final formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});


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
                      key: formKey,
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
                          CustomTextField(
                            hintText: "username",
                            controller: controller.usernameController.value,
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
                          CustomTextField(
                              hintText: "Email",
                              validator: (value) {
                                if(value==null|| value.isEmpty ){
                                      return "please enter Email";
                                }
                                return null;
                              },
                              controller: controller.emailController.value),

                              const SizedBox(height: 10,),
                              GetX<AuthServices>(
                                builder: (controller) {
                                  return IntlPhoneField(
                                  controller: controller.phoneController.value,
                                  initialCountryCode: controller.countrycode.value,
                                  onCountryChanged: (value) {
                                    controller.countrycode.value=value.dialCode;
                                  },

                                  cursorColor: Colors.white,
                                  decoration:InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Phone",
                                    hintStyle: GoogleFonts.roboto(color:Colors.grey),
                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                    filled: true,
                                    focusColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                              
                                    ),
                                  ),
                                );
                                },
                                 
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          GetX<AuthServices>(builder: (controller) {
                            return CustomTextField(
                              obscureValue: controller.obscurepassword.value,
                              suffixIcon: controller.obscurepassword.value
                                  ? InkWell(
                                      onTap: () {
                                        controller.obscurepassword.value =
                                            !controller.obscurepassword.value;
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.lock,
                                        color: Constants().primaryColor,
                                      ))
                                  : InkWell(
                                      onTap: () {
                                        controller.obscurepassword.value =
                                            !controller.obscurepassword.value;
                                      },
                                      child: Icon(FontAwesomeIcons.lockOpen,
                                          color: Constants().primaryColor)),
                              hintText: "Password",
                              controller: controller.passwordController.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter correct password";
                                }
                                return null;
                              },
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          GetX<AuthServices>(
                            builder: (controller) {
                              return CustomTextField(
                                hintText: "ConfirmPassword",
                                obscureValue: controller.obscurepassword.value,
                                controller:
                                    controller.confirmPasswordController.value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter correct password";
                                  } else {
                                    if (controller.passwordController.value.text
                                            .toString() !=
                                        value) {
                                      return "passwords don't match";
                                    }
                                    return null;
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomElevatedButton(
                              width: width,
                              height: height * 0.4,
                              onPressed: () async {
                            
                                if (formKey.currentState!.validate()) {
                                  var response = await controller.signUpWithEmailandPassword();
                                  //sign up
                                  if (response is String) {
                                    Get.snackbar(response, response.toString(),snackPosition: SnackPosition.BOTTOM,duration: const Duration(milliseconds: 3));
                                  }else{

                                    controller.saveWholeDataInDatabase();
                                  }
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
                                  onPressed: () {

                                  },
                                  child: Text("Login",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,

                                          
                                          ),
                                          
                                          )),
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
