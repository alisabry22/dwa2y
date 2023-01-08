import 'package:dwa2y/Controllers/AddressControllers/address_controller.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:dwa2y/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

class AddAddress extends GetView<AddressController> {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar:  AppBar(
        title: Text(
          "Add New Address",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
    
    ),
    body: Container(
         width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 4, 16, 89),
            Color.fromARGB(255, 1, 15, 57),
          ]),
          
        ),

        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Form(
                key: controller.addAddresKey,
                child: Column(
                  children: [
                    CustomTextField(hintText: "Address Title", validator: (p){}, controller: controller.addressTitle.value),
                   const  SizedBox(height: 10,),
                    CustomTextField(hintText: "Phone", validator: (p){}, controller: controller.phone.value),
                                 const  SizedBox(height: 10,),
        
                    CustomTextField(hintText: "Street Name", validator: (p){}, controller: controller.streetName.value),
                                 const  SizedBox(height: 10,),
        
                    CustomTextField(hintText: "Building", validator: (p){}, controller: controller.buildingName.value),
                               const  SizedBox(height: 10,),
        
                    CustomTextField(hintText: "Floor", validator: (p){}, controller: controller.floor.value),
                                 const  SizedBox(height: 10,),
        
                    CustomTextField(hintText: "Apartment", validator: (val){
                           if(val==null || val.isEmpty){
                    return "Please Enter Apartment number";
                  }
                    }, controller: controller.appartment.value),
                                 const  SizedBox(height: 10,),
                      
                  
        
                  ],
                
                ),
              ),
                CustomTextField(hintText: "Landmark (optional)", validator: (val){
                  return null;
                }, controller: controller.landmark.value),
                const  SizedBox(height: 10,),

                CustomElevatedButton(width: MediaQuery.of(context).size.width*0.8, height: 100, onPressed: (){}, text: "Select Your Location"),
                    const  SizedBox(height: 10,),
                                CustomElevatedButton(width: MediaQuery.of(context).size.width*0.8, height: 100, onPressed: (){}, text: "Submit"),

            ],
          ),
        ),
    ),
    );
  }
}