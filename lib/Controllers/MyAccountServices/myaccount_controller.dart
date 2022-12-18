
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountController extends GetxController{
RxString currentUserID="".obs;
late StreamSubscription streamsub;
Rx<TextEditingController> searchPlace=TextEditingController().obs;


  Rx<UserModel> currentUserData= UserModel(
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
 late SharedPreferences sharedPreferences;
 RxString currentuserID="".obs;

  @override
  void onInit()async {
    
  print("my account controller");
     sharedPreferences=await SharedPreferences.getInstance();
   
      currentUserData.bindStream(_getCrruntUserData());
      currentUserData.refresh();
  

     print(currentUserData.value.countrycode);
     
     
     
     super.onInit();



  }

  Stream<UserModel> _getCrruntUserData(){

        
      
        
   
           return FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots().map((event) {
          
            return UserModel.fromDocumentSnapshot(event);
          });
      }


        
       
          
       
     
        
      
  



  
  }
