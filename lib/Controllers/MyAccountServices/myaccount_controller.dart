import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/user_model.dart';

class MyAccountController extends GetxController {
  RxString currentUserID = "".obs;
  Rx<TextEditingController> searchPlace = TextEditingController().obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxString groupvalue = "Male".obs;

  Rx<UserModel> currentUserData = UserModel( lat: 0.0, long: 0.0, ).obs;
 

  AuthServices accountController=Get.find<AuthServices>();

  @override
  void onInit()  {
    

    currentUserData.value=accountController.currentUserData.value;
      print("account controller ${currentUserData.value.username}");

    accountController.currentUserData.listen((p0) {
      currentUserData.value=p0;
      print("my account controller changed");
    });


    super.onInit();
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
