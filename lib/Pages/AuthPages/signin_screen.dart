
import 'package:dwa2y/Constants/constants.dart';
import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Pages/AuthPages/sigup_screen.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
        
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    Constants().primaryColor.withOpacity(0.6),
                   Constants().primaryColor.withOpacity(0.3),
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
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                   const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Get Your Medicine quickly ,,",
                      style: GoogleFonts.ubuntu(
                          fontSize: 12,
                          color: Colors.white,
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
                    hintText: "Phone",
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
                    onHover: (value) {
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        color: Colors.white,
                                 
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                
                CustomElevatedButton(text: "Sign In",width: width, height: height,onPressed: (){
                  
                },),
             const   SizedBox(
                  height: 20,
                ),
                Text(
                  "---------- or continue with ----------",
                  style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
               const SizedBox(
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
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                                TextButton(onPressed: (){
                                  Get.to(()=>const SignUpScreen());
                                }, child: Text("Register Now",style: GoogleFonts.roboto(color: Colors.white),))
                  ],
                ),
                      
              ],
            ),
          ),
        ),
      ),
    );
  }
}


