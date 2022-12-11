import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Models/user_model.dart';

class GoogleMapServicers extends GetxController {
 late GoogleMapController controller ;
  Rx<TextEditingController> searchPlace=TextEditingController().obs;
   CameraPosition cameraPosition=CameraPosition(target: LatLng(20.42796133580664,75.885749655962),zoom: 11);
   RxDouble lat=0.0.obs;
   RxDouble long=0.0.obs;
   RxList<Marker> markers=RxList.empty();

  Rx<UserModel> currentUserData = UserModel(
          username: "",
          phone: "",
          type: "",
          countrycode: "",
          profileImageLink: "",
          lat: "",
          long: "",
          createdAt: "",
          updatedAt: "")
      .obs;

  RxString currentuserID = "".obs;

  @override
  void onInit()async {
    currentUserData.value=await getInitialData();
    lat.value=double.parse(currentUserData.value.lat);
    long.value=double.parse(currentUserData.value.long);
    
    cameraPosition=CameraPosition(target: LatLng(lat.value,long.value),zoom: 11);
    markers.add(
       Marker(markerId: const MarkerId("1"),
            position: LatLng(lat.value,long.value),
            infoWindow:const InfoWindow(title: "My Position"),
          ),
         
    );
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
  void handleSearchInMap(){
    

  }
}
