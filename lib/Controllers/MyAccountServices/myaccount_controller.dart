import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/user_model.dart';

class MyAccountController extends GetxController {
  RxString currentUserID = "".obs;
  late StreamSubscription streamsub;
  Rx<TextEditingController> searchPlace = TextEditingController().obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxString groupvalue = "Male".obs;
  StreamSubscription<DocumentSnapshot>? listenStream;

  Rx<UserModel> currentUserData = UserModel(
    lat: 0.0,
    long: 0.0,
  ).obs;
  late SharedPreferences sharedPreferences;
  RxString currentuserID = "".obs;

  @override
  void onInit() async {
    if(FirebaseAuth.instance.currentUser!=null){
         currentUserData.bindStream(getCrruntUserData());
         
    }
 

    sharedPreferences = await SharedPreferences.getInstance();

    super.onInit();
  }

  Stream<UserModel> getCrruntUserData() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((event) {
      print("evnt.data ${event.data()} " );
      return UserModel.fromDocumentSnapshot(event);
    });
  }

  Future updateBirthDay(String birthDay) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"birthday": birthDay});
  }

  Future updateType(String gender) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"gender": gender});
  }

  Future updateUserName(String username) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"username": username});
  }

  Future updateEmail(String email) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"email": email});
  }
}
