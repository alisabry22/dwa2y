import 'package:cached_network_image/cached_network_image.dart';
import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class HomeScreen extends GetView<AuthServices> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.usermodel.value.username);
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: Drawer(
          backgroundColor: Color(0xff2B3A55),
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Constants().primaryColor.withOpacity(0.6),
                          Constants().primaryColor.withOpacity(0.3),
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       CircleAvatar(
                        backgroundImage: controller.usermodel.value.profileImageLink.isNotEmpty
                            ? CachedNetworkImageProvider(controller.usermodel.value.profileImageLink)as ImageProvider
                            : const AssetImage("assets/images/patient.png"),
                        radius: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.usermodel.value.username,
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Colors.white),
                      ),
                    ],
                  )),
              ListTile(
                title: Text(
                  "Upload Prescrition",
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "View My Orders",
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                ),
              ),
               ListTile(
                title: Text(
                  "Edit Profile",
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  "Language",
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: (){
                  controller.signOut();
                },
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
      appBar: AppBar(
        title: Text("Welcome ${controller.usermodel.value.username}, ",
            style: GoogleFonts.ubuntu(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Constants().primaryColor.withOpacity(0.6),
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
      ),
    );
  }
}
