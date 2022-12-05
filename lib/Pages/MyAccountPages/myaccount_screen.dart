import 'package:cached_network_image/cached_network_image.dart';
import 'package:dwa2y/Constants/constants.dart';
import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Pages/AuthPages/logout_page.dart';
import 'package:dwa2y/Pages/GoogleMapPages/googlemap_page.dart';
import 'package:dwa2y/Pages/MyAccountPages/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/custome_list_tile.dart';

class MyAccountPage extends GetView<MyAccountController> {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GetX<MyAccountController>(
            builder: (controller) {
              return CircleAvatar(
                backgroundImage: controller
                        .currentUserData.value.profileImageLink.isNotEmpty
                    ? CachedNetworkImageProvider(
                            controller.currentUserData.value.profileImageLink)
                        as ImageProvider
                    : const AssetImage("assets/images/patient.png"),
                radius: 20,
              );
            },
          ),
        ),
        title: GetX<MyAccountController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.currentUserData.value.username,
                    style: GoogleFonts.ubuntu(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Text("0${controller.currentUserData.value.phone}",
                    style: GoogleFonts.ubuntu(fontSize: 16)),
              ],
            );
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
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
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "My Account",
                style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Constants().primaryColor.withOpacity(0.6),
                        Constants().primaryColor.withOpacity(0.3),
                      ]),
                ),
                child: Column(
                  
                  children: [
                  
                   CustomListTile(
                    
                    onTap: (){
                    Get.to(()=>const PersonalInformation());
                   }, leading: const Icon(Icons.person,color: Colors.white, ),title: "Personal Information",),
                   
                  CustomListTile(onTap: (){}, leading: const Icon(Icons.settings,color: Colors.white, ),title: "Account Setting",),
                   const Divider(
                   thickness: 1,
                    ),
                   CustomListTile(onTap: (){}, leading: const Icon(Icons.payment_outlined,color: Colors.white, ),title: "Payment methods",),
                  const Divider(
                   thickness: 1,
                    ),
                    CustomListTile(onTap: (){
                      Get.to(()=>const GoogleMapPage());
                    }, leading: const Icon(Icons.home,color: Colors.white, ),title: "Billing Address",),
                 const Divider(
                   thickness: 1,
                    ),
                    CustomListTile(onTap: (){}, leading: const Icon(Icons.help_center,color: Colors.white, ),title: "Help and Support",),
                  ],
                ),
              ),
               const SizedBox(height: 20,),
                 Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Constants().primaryColor.withOpacity(0.6),
                        Constants().primaryColor.withOpacity(0.3),
                      ]),
                ),
                child: CustomListTile(title: "Logout",onTap: (){
                  Get.to(()=>const LogOutPage());
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


