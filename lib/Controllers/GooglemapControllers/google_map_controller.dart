import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/user_model.dart';

class GoogleMapController extends GetxController{
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
  void onInit() {
   currentUserData.bindStream(getCrruntUserData());
    super.onInit();
  }

  

    Stream<UserModel> getCrruntUserData(){
       
        if(sharedPreferences.getString("UserID")!=null){
          currentuserID.value=sharedPreferences.getString("UserID")!;
        }
        
       return FirebaseFirestore.instance.collection("users").doc(currentuserID.value).snapshots().map((event) {

          return UserModel.fromDocumentSnapshot(event);
        });
  }


}