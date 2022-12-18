import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:dwa2y/Controllers/AuthRepositories/home_controller.dart';
import 'package:dwa2y/Controllers/LocationController/location_controller.dart';

=======
>>>>>>> 8e4e7de5e95a49a25ad084da6a64a20ce88762d6
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Models/user_model.dart';

class GoogleMapServicers extends GetxController {
  Rx<TextEditingController> searchPlace=TextEditingController().obs;
  RxDouble latitude=0.0.obs;
  RxDouble longitude=0.0.obs;
  GoogleMapController? mapController;
  

   Rx< CameraPosition> cameraPosition=CameraPosition(
        target: LatLng(20.42796133580664,
            75.885749655962),
        zoom: 14.4746).obs;
  RxList <Marker> markers=[  Marker(markerId: MarkerId("1"), position: LatLng(20.42796133580664,75.885749655962),infoWindow: InfoWindow(title: "My Position"),),
        ].obs;

  Rx<UserModel> currentUserData = UserModel(
          username: "",
          phone: "",
          type: "",
          countrycode: "",
          profileImageLink: "",
          lat: 0.0,
          long:0.0,
          createdAt: "",
          updatedAt: "",address: "")
      .obs;

  RxString currentuserID = "".obs;

  @override
  void onInit()async {
    currentUserData.value=await getInitialData();
    currentUserData.bindStream(getCrruntUserData());
    // lat.value=double.parse(currentUserData.value.lat) ;
    // long.value=double.parse(currentUserData.value.long) ;
    

markers.value.clear();
cameraPosition.value=CameraPosition(target: LatLng(0.0,0.0));
print(cameraPosition.value.target);
cameraPosition.value=CameraPosition(target: LatLng(latitude.value,longitude.value),zoom:14.4746 );
    
  cameraPosition.refresh();
markers.value=[
  Marker(markerId: MarkerId("1"), position: LatLng(latitude.value,longitude.value),infoWindow: InfoWindow(title: "My Position"),)
];
markers.refresh(); 





    super.onInit();

  }
  
  

  Future<UserModel> getInitialData()async{

   final snapshot= await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    
    return UserModel.fromDocumentSnapshot(snapshot);

  }
  Stream<UserModel> getCrruntUserData() {


    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((event) {
      return UserModel.fromDocumentSnapshot(event);
    });
  }
}


