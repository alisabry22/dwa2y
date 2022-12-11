import 'package:dwa2y/Controllers/GooglemapControllers/google_map_services.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:dwa2y/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Constants/constants.dart';

class GoogleMapPage extends GetView<GoogleMapServicers> {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Constants().primaryColor.withOpacity(0.6),
                  Constants().primaryColor.withOpacity(0.3),
                ]),
          ),
          child: Stack(
            children: [
           
              GetX<GoogleMapServicers>(
                builder: (controller) {
                  return GoogleMap(
                  initialCameraPosition: controller.cameraPosition,
                  markers: Set<Marker>.of(controller.markers.value),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController cont) {
                    controller.controller = cont;
                  },
                );
                },
             
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 20),
                child: Positioned(
                  top: 20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: CustomTextField(
                    hintText: "place",
                    obscureValue: false,
                    suffixIcon: Icon(Icons.search),
                    validator: (p0) {
                      
                    },
                    controller:controller.searchPlace.value,
                                ),
                  ),
                
                ),
              ),
              
            
              Positioned(
                bottom: 0,
                
                  child: CustomElevatedButton(
                      height: MediaQuery.of(context).size.height * 0.1,
                      onPressed: () {},
                      text: "Update Address",
                      width: MediaQuery.of(context).size.width * 0.8))
            ],
          ),
        ),
      ),
    );
  }
}
