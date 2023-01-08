import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Constants/constants.dart';
import '../../Controllers/MyAccountServices/myaccount_controller.dart';

class AddressInformation extends GetView<MyAccountController> {
  const AddressInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Address Information",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions:const [
          Icon(Icons.edit),
          SizedBox(width: 20,),
           Icon(Icons.delete),
           SizedBox(width: 20,),
        ],
        
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
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(controller.currentUserData.value.lat,
                        controller.currentUserData.value.long)),
                mapType: MapType.normal,
                markers: <Marker>{
                  Marker(
                      markerId: const MarkerId("My Position"),
                      position: LatLng(controller.currentUserData.value.lat,
                          controller.currentUserData.value.long)),
                },
                minMaxZoomPreference: const MinMaxZoomPreference(13, 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.04,
              color: Colors.white,
              child: Center(
                child: Text(
                  "Address Information",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              color: Colors.white,
              child: Text(
                "Name: ",
                style: GoogleFonts.roboto(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phone",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                      Text("0${controller.currentUserData.value.phone!}"),
                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Governorate",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Area",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Region",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Street",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Building Number",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Floor",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Apartment",style: GoogleFonts.roboto(fontWeight:FontWeight.w500),),
                                    ],
                                  ),
                                ],
                              ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
