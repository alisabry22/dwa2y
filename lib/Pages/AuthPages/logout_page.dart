import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

class LogOutPage extends GetView<AuthServices> {
  const LogOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
             title: Text(
          "Logout",
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Constants().primaryColor.withOpacity(0.6),
                  Constants().primaryColor.withOpacity(0.3),
                ]),
        ),
        child: Center(
          child: CustomElevatedButton(
        height: MediaQuery.of(context).size.height * 0.2,
        onPressed: () {
          controller.signOut();
        },
        text: "Logout",
        width: 120,
          ),
        ),
      ),
    );
  }
}
