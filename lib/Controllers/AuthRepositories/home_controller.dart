import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/user_model.dart';

class HomeController extends GetxController {

  late SharedPreferences sharedprefs;
  String? sharedPrefCurrentUser;
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
  @override
  void onInit() async {
    sharedprefs = await SharedPreferences.getInstance();
    sharedPrefCurrentUser = sharedprefs.getString("UserID");
    currentUserData.bindStream(_getCurrentUserData());
   
    super.onInit();
  }

  Stream<UserModel> _getCurrentUserData() {
    print("home stream");

    final usersCollection = FirebaseFirestore.instance.collection("users");

        return usersCollection.doc(FirebaseAuth.instance.currentUser!.uid).snapshots().map((event) {
      return UserModel.fromDocumentSnapshot(event);
    });
   
  
  }


}
