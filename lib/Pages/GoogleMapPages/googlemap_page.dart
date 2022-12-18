import 'package:dwa2y/Controllers/GooglemapControllers/google_map_services.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:dwa2y/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
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
               Positioned(
                top: 20,
                child: CustomTextField(
                  controller: controller.searchPlace.value,
                  hintText: "Search Place",
                  obscureValue: false,
                  suffixIcon: Icon(Icons.search),
                  validator: (p0) {
                    
                  },

              )),
              GetX<GoogleMapServicers>(
                builder: (controller) {
                  print(controller.cameraPosition.value.target.toString()+"initial");
                  return GoogleMap(
                  initialCameraPosition: controller.cameraPosition.value,
                  
                  markers: Set<Marker>.of(controller.markers),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController cont) {
                    controller.mapController=cont;
                
                  },
                );
                },
                
              ),

             
              Positioned(
                bottom: 10,
                child: CustomElevatedButton(
                onPressed: (){

                },
                text: "Update address",
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*0.8,

              )),
            ],

       
        
          ),
        ),
      ),
    );
  }
}
