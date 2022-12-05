import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Models/user_model.dart';

class GoogleMapServicers extends GetxController {
  Completer<GoogleMapController> controller = Completer();
   late CameraPosition cameraPosition=CameraPosition(
        target: LatLng(20.42796133580664,
            75.885749655962),
        zoom: 14.4746);
  late List<Marker> markers=[
          Marker(markerId: MarkerId("1"),
            position: LatLng(20.42796133580664,75.885749655962),
            infoWindow: InfoWindow(title: "My Position"),
          ),
        ];

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
    currentUserData.bindStream(getCrruntUserData());
    print(currentUserData.value.lat+" "+currentUserData.value.long);


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
  void placeMap(){

  }
}
