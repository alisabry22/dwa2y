import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{

  Rx<TextEditingController> addressTitle=TextEditingController().obs;
  Rx<TextEditingController> phone=TextEditingController().obs;
  Rx<TextEditingController> streetName=TextEditingController().obs;
  Rx<TextEditingController> buildingName=TextEditingController().obs;
  Rx<TextEditingController> floor=TextEditingController().obs;
  Rx<TextEditingController> appartment=TextEditingController().obs;
  Rx<TextEditingController> landmark=TextEditingController().obs;
  final  addAddresKey=GlobalKey<FormState>();


Future saveAddress()async{


  var data={

    "AddressTitle":addressTitle.value.text.trim(),
    "Phone":phone.value.text.trim(),
    "StreetName":streetName.value.text.trim(),
    "BuildingName":buildingName.value.text.trim(),
    "Floor":floor.value.text.trim(),
    "Appartment":appartment.value.text.trim(),
    "Landmark":landmark.value.text.trim(),
  };
  await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({"address":FieldValue.arrayUnion([data])});
}



}