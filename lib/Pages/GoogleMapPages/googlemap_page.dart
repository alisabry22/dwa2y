import 'package:dwa2y/Controllers/GooglemapControllers/google_map_services.dart';
import 'package:dwa2y/Controllers/LocationController/location_controller.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:dwa2y/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    initialCameraPosition: controller.cameraPosition.value,
                    minMaxZoomPreference:const MinMaxZoomPreference(13, 16),
                   
                    markers: Set<Marker>.of(controller.markers),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController cont) {
                      controller.mapController = cont;
                      controller.updateCameraPosition();
                    },
                  );
                },
              ),
              Positioned(
                top: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: GetX<GoogleMapServicers>(
                        builder: (controller) {
                          return CustomTextField(
                            controller: controller.searchPlace.value,
                            hintText: "pick Place",
                            onchanged: (p0) {
                              controller.updateLocation(p0);
                            },
                            validator: (p0) {},
                            obscureValue: false,
                            suffixIcon: const Icon(Icons.search),
                          );
                        },
                      )),
                ),
              ),
              Positioned(
                top: 20,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60,left: 15),
                  child: GetX<GoogleMapServicers>(
                    builder: (controller) {
                      if(controller.placePredictions.isNotEmpty){
                        return Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width*0.8,
                      color: Colors.white,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              controller.getLatAndLong(controller.placePredictions[index].placeId!,controller.placePredictions[index].description!);
                              controller.updateMarkers();
                              controller.updateCameraPosition();
                              controller.placePredictions.value=[];

                            },
                            child: ListTile(
                              title: Text("${controller.placePredictions[index].description}",style: GoogleFonts.roboto(color:Colors.black),),
                            ),
                          );
                        },
                        itemCount: controller.placePredictions.length,
                      ),
                    );
                      }else{
                        return Container();
                      }
                    },
                   
                  ),
                ),
              ),
               Positioned(
                  bottom: 60,
                  child: CustomElevatedButton(
                    onPressed: () async{
                    await controller.getCurrentLocation();
                     Get.back();

                    },
                    text: "Update To Current Location",
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                  )),
              Positioned(
                  bottom: 10,
                  child: CustomElevatedButton(
                    onPressed: () {
                      controller.updateFirebaseLocation();
                        Get.back();
                    },
                    text: "Save Picked address",
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
