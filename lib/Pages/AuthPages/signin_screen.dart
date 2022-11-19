import 'dart:ui';

import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends GetView<AuthServices> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 203, 203, 218),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xffa9a9a9).withOpacity(0.3),
                    const Color(0xffd3d3d3),
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Sign in To Dwa2y",
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Get Your Medicine quickly ,,",
                        style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(
                        FontAwesomeIcons.lock,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                 
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.9, height * 0.13),
                        backgroundColor: const Color(0xffFC6B68),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sign In ",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "---------- or continue with ----------",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle),
                          child:
                              SvgPicture.asset("assets/images/facebook.svg")),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle),
                          child: SvgPicture.asset("assets/images/google.svg")),
                    ],
                  ),
                const  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Don't Have Account?",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                                  TextButton(onPressed: (){}, child: Text("Register Now",style: GoogleFonts.robotoFlex(),))
                    ],
                  ),
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
