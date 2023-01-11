import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Controllers/AuthRepositories/home_controller.dart';
import 'package:dwa2y/Controllers/LocationController/location_controller.dart';
import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Models/Address.dart';
import 'package:dwa2y/Models/user_model.dart';
import 'package:dwa2y/Pages/AuthPages/auth_route.dart';
import 'package:dwa2y/Pages/AuthPages/signin_screen.dart';
import 'package:dwa2y/Pages/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends GetxController {
  late Rx<User?> currentuser;
  Rx<UserModel> usermodel = UserModel(
    lat: 0.0,
    long: 0.0,
  ).obs;
  Rx<UserModel> currentUserData = UserModel(
    lat: 0.0,
    long: 0.0,
  ).obs;
  RxBool isCustomer = true.obs;
  RxString groupValue = "Customer".obs;
  RxBool isLoading = false.obs;
  RxList<Address> addresses = RxList.empty();
//TextEditing Controllers for Signup screen
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxString profileImagePath = "".obs;
  RxString countrycode = "EG".obs;
  RxString dialCode = "+20".obs;
  RxString verificationId = "".obs;
  RxBool obscurepassword = true.obs;
  late SharedPreferences sharedprefs;
  StreamSubscription<DocumentSnapshot>? listenStream;

  @override
  void onClose() {
    super.onClose();
    if (listenStream != null) {
      listenStream!.cancel();
    }
  }

  @override
  void onInit() async {
    currentuser = Rx<User?>(FirebaseAuth.instance.currentUser);
    currentuser.bindStream(FirebaseAuth.instance.authStateChanges());
  if(FirebaseAuth.instance.currentUser!=null){
    print("Get current user data calledd");
  _getCrruntUserData();
  }


   
    ever(currentuser, _setInitialScreen);
    sharedprefs = await SharedPreferences.getInstance();

    super.onInit();
  }

  _setInitialScreen(User? user) {
    Get.offAll(() => const AuthRouter());
  }

  Future pickprofileImage() async {
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      profileImagePath.value = file.path;
    } else {
      return null;
    }
  }

  Future signUpWithEmailandPassword() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.value.text.trim(),
              password: passwordController.value.text.trim());

      if (credential.user != null) {
        sharedprefs.setString("UserID", credential.user!.uid);
      }

      return true;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future signInMethod() async {
    showDialog();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.value.text.trim(),
          password: passwordController.value.text.trim());
      return true;
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    }
  }

  Future saveDataInFirebase(photolink) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final usersCollection = FirebaseFirestore.instance.collection("users");
    var locationController = Get.find<LocationController>();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationController.lat.value, locationController.long.value);
    Placemark place = placemarks[0];
    // address.value="${place.street!} ${place.administrativeArea!} ${place.locality!}";

    UserModel userModel = UserModel(
      username: usernameController.value.text,
      phone: phoneController.value.text,
      countrycode: countrycode.value,
      profileImageLink: photolink,
      type: groupValue.value,
      lat: locationController.lat.value,
      long: locationController.long.value,
      createdAt: DateTime.now().toLocal().toString(),
      updatedAt: DateTime.now().toLocal().toString(),
      addresses: addresses,
    );
    final jsonMap = userModel.userModelToJson();

    await usersCollection.doc(userId).set(jsonMap);
  }

  Future<String> uploadImageToDatabase() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final storage = FirebaseStorage.instance.ref("profileImages/$userId");
    if (profileImagePath.value.isNotEmpty) {
      File profileImageToUpload = File(profileImagePath.value);
      await storage.putFile(profileImageToUpload);
      String downloadUrl = await storage.getDownloadURL();
      return downloadUrl;
    }
    return "";
  }

  Future saveWholeDataInDatabase() async {
    showDialog();
    String photourl = await uploadImageToDatabase();
    await saveDataInFirebase(photourl);
    Get.offAll(() => const DashBoardPage());
  }

  void showDialog() {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [CircularProgressIndicator(), Text("Loading...")],
          ),
        ),
      ),
    );
  }

  Future signOut() async {
    if (listenStream != null) {
 

      print("auth Controller");
      await listenStream!.cancel();
    }
    await FirebaseAuth.instance.signOut();
  }

   _getCrruntUserData() {
    listenStream = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
          print(event.data());
          currentUserData.value=UserModel.fromDocumentSnapshot(event);
          currentUserData.refresh();
        });

   
  }
}
