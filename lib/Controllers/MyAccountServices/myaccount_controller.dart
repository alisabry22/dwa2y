
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountController extends GetxController{
RxString currentUserID="".obs;
late StreamSubscription streamsub;

  Rx<UserModel> currentUserData= UserModel(
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
 late SharedPreferences sharedPreferences;
 RxString currentuserID="".obs;

  @override
  void onInit()async {
    super.onInit();

     sharedPreferences=await SharedPreferences.getInstance();
   
      currentUserData.bindStream(_getCrruntUserData());
   
     



  }

  Stream<UserModel> _getCrruntUserData(){

        
        if(sharedPreferences.getString("UserID")!=null){
          currentuserID.value=sharedPreferences.getString("UserID")!;
         
        }

        
   
           return FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots().map((event) {

            return UserModel.fromDocumentSnapshot(event);
          });
      }
        
       
          
       
     
        
      
  



  
  }
