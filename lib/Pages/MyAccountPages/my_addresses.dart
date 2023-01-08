import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Pages/MyAccountPages/add_address.dart';
import 'package:dwa2y/Pages/MyAccountPages/address_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

class MyAddresses extends GetView<MyAccountController> {
  const MyAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "My Address",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
        actions:  [
          InkWell(onTap: (){
            Get.to(()=> const AddAddress());
          },child:const Icon(Icons.add)),
         const SizedBox(width: 15,),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 4, 16, 89),
            Color.fromARGB(255, 1, 15, 57),
          ]),
        ),
        child: 
                controller.currentUserData.value.addresses!=null &&controller.currentUserData.value.addresses!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const AddressInformation());
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 56, 5, 185),
                            Color.fromARGB(255, 0, 0, 0),
                          ]),
                        ),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.currentUserData.value.addresses![0].streetName!,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text("Click To Edit ",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )),
                      ),
                    ),
                  ],
                ))
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/address.png"),
                   const  SizedBox(height: 15,),
                    Text("Please Add New Address...",style: GoogleFonts.roboto(color:Colors.white,fontWeight:FontWeight.w500,)),
                  ],
                ))),
      ),
    );
  }
}
