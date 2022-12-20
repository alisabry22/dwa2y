import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        zoom: 40.4746).obs;
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
   
   latitude.value=currentUserData.value.lat;
   longitude.value=currentUserData.value.long;
    

markers.value.clear();

print(cameraPosition.value.target);
cameraPosition.value=CameraPosition(target: LatLng(latitude.value,longitude.value),zoom:40.4746 );
    
  cameraPosition.refresh();
  log(latitude.value.toString()+longitude.value.toString());
markers.value=[
  Marker(markerId: MarkerId("1"), position: LatLng(latitude.value,longitude.value),infoWindow: InfoWindow(title: "My Position"),)
];
markers.refresh(); 
print(markers.first);





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

  updateCameraPosition()async{

    cameraPosition.value=CameraPosition(target: LatLng(latitude.value,longitude.value));
   await mapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition.value));
    
  }
}


