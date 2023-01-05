import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Models/placeautocomplete_prediction.dart';
import 'package:dwa2y/Models/places_auto_complete_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import '../../Models/user_model.dart';

class GoogleMapServicers extends GetxController {
  Rx<TextEditingController> searchPlace = TextEditingController().obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address="".obs;
  GoogleMapController? mapController;
  RxList<PlaceAutoCompletePrediction> placePredictions=RxList.empty();
  RxDouble zoomvalue=14.402209281921387.obs;
    late Position positionSetting;



  Rx<CameraPosition> cameraPosition = const CameraPosition(
          target: LatLng(20.42796133580664, 75.885749655962), zoom: 14.402209281921387)
      .obs;
  RxList<Marker> markers = [
   const Marker(
      markerId: MarkerId("1"),
      position: LatLng(20.42796133580664, 75.885749655962),
      infoWindow: InfoWindow(title: "My Position"),
    ),
  ].obs;

  Rx<UserModel> currentUserData = UserModel(
          username: "",
          phone: "",
          type: "",
          countrycode: "",
          profileImageLink: "",
          lat: 0.0,
          long: 0.0,
          createdAt: "",
          updatedAt: "",
          address: "")
      .obs;

  RxString currentuserID = "".obs;

  @override
  void onInit() async {
    currentUserData.value = await getInitialData();
    currentUserData.bindStream(getCrruntUserData());
   ever(currentUserData, _changeValues);

    latitude.value = currentUserData.value.lat;
    longitude.value = currentUserData.value.long;


    cameraPosition.value = CameraPosition(target: LatLng(latitude.value, longitude.value), zoom: zoomvalue.value);

    cameraPosition.refresh();
   
  updateMarkers();
    super.onInit();
  }

  Future<UserModel> getInitialData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return UserModel.fromDocumentSnapshot(snapshot);
  }

  void updateMarkers(){
        markers.clear();
     markers.value = [
      Marker(
        markerId:const MarkerId("1"),
        position: LatLng(latitude.value, longitude.value),
        infoWindow:const InfoWindow(title: "My Position"),
      )
    ];
    markers.refresh();
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

  updateCameraPosition() async {
    cameraPosition.value =
        CameraPosition(target: LatLng(latitude.value, longitude.value));
    await mapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition.value));
  }

  Future updateLocation(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com", "maps/api/place/autocomplete/json", {

          "input":query,
          "key":"AIzaSyClHN31_AJxOD2z9LzWZ8i9UgVsBoL3ftE",

        });

     
  final response=await http.get(uri);

  if(response.statusCode==200){
    
    PlacesAutoCompleteResponse placeresponse=PlacesAutoCompleteResponse.parseAutoCompleteResult(response.body);
    if(placeresponse.predictions!=null){
      placePredictions.value=placeresponse.predictions!;
      placePredictions.refresh();
    }
  }

  }

//to get current lat and long of choosen address from search
  Future getLatAndLong(String placeId,String description)async{

    GoogleMapsPlaces  mapsPlaces= GoogleMapsPlaces(apiKey:"AIzaSyClHN31_AJxOD2z9LzWZ8i9UgVsBoL3ftE" );
    PlacesDetailsResponse placesDetailsResponse=  await mapsPlaces.getDetailsByPlaceId(placeId);

    latitude.value=placesDetailsResponse.result.geometry!.location.lat;
    longitude.value=placesDetailsResponse.result.geometry!.location.lng;
     address.value=description;

    updateCameraPosition();
    updateMarkers();


  }

  Future updateFirebaseLocation()async{

    final data={
      "lat":latitude.value,
      "long":longitude.value,
      "address":address.value,
    };
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update(data);

  }

    Future getCurrentLocation()async {
      
    positionSetting = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.best );
    latitude.value=positionSetting.latitude;
    longitude.value=positionSetting.longitude;
List<Placemark> placemarks=await placemarkFromCoordinates(latitude.value, longitude.value);
  address.value="${placemarks[0].subAdministrativeArea} ${placemarks[0].administrativeArea} ${placemarks[0].name}";
  updateFirebaseLocation();

  }

  _changeValues(UserModel userModel) {

    updateMarkers();
  }
}
