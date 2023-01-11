import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Constants/constants.dart';
import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Pages/AuthPages/logout_page.dart';
import 'package:dwa2y/Pages/MyAccountPages/account_setting.dart';
import 'package:dwa2y/Pages/MyAccountPages/my_addresses.dart';
import 'package:dwa2y/Pages/MyAccountPages/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/custome_list_tile.dart';

class MyAccountPage extends GetView<MyAccountController> {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 4, 16, 89),
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child:
               
    
                   CircleAvatar(
                    backgroundImage:controller.currentUserData.value.profileImageLink!=null && controller.currentUserData.value.profileImageLink!.isNotEmpty?
                        CachedNetworkImageProvider(
                               controller.currentUserData.value.profileImageLink!)
                            as ImageProvider
                        : const AssetImage("assets/images/patient.png"),
                    radius: 20,
                  ),
               
              ),
            title:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(()=>    Text(controller.currentUserData.value.username!=null?controller.currentUserData.value.username!:"",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16, fontWeight: FontWeight.bold)),),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("0${controller.currentUserData.value.phone}",
                        style: GoogleFonts.ubuntu(fontSize: 16)),
                  ],
              
             
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                   Color.fromARGB(255, 4, 16, 89),
                        Color.fromARGB(255, 1, 15, 57),
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
                    height: MediaQuery.of(context).size.height * 0.5,
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
                    child:  SingleChildScrollView(
                      child: Column(
                        
                        children: [
                        
                         CustomListTile(
                          
                          onTap: (){
                          Get.to(()=>const PersonalInformation());
                         }, leading: const Icon(Icons.person,color: Colors.white, ),title: "Personal Information",),
                         const Divider(
                         thickness: 1,
                          ),
                        CustomListTile(onTap: (){
                          Get.to(()=>const AccountSetting());
                        }, leading: const Icon(Icons.settings,color: Colors.white, ),title: "Account Setting",),
                         const Divider(
                         thickness: 1,
                          ),
                         CustomListTile(onTap: (){}, leading: const Icon(Icons.payment_outlined,color: Colors.white, ),title: "Payment methods",),
                        const Divider(
                         thickness: 1,
                          ),
                          GetX<MyAccountController>(
                            builder: (controller) {
                              return  CustomListTile(onTap: (){
                              Get.to(()=>const MyAddresses());
                            }, leading: const Icon(Icons.home,color: Colors.white, ),title: "Billing Address",subtitile:controller.currentUserData.value.addresses!=null&&controller.currentUserData.value.addresses!.isNotEmpty ?controller.currentUserData.value.addresses![0].streetName!:"" );
                            },
                          
                          ),
                       const Divider(
                         thickness: 1,
                          ),
                          CustomListTile(onTap: (){}, leading: const Icon(Icons.help_center,color: Colors.white, ),title: "Help and Support",),
                        ],
                      ),
                    ),
                  ),
                   const SizedBox(height: 20,),
                     Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.08,
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


