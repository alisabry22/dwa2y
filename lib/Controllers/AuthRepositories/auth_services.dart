import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Controllers/LocationController/location_controller.dart';
import 'package:dwa2y/Models/user_model.dart';
import 'package:dwa2y/Pages/AuthPages/signin_screen.dart';
import 'package:dwa2y/Pages/dashboard_page.dart';
import 'package:dwa2y/Pages/introductionscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends GetxController {
  late Rx<User?> currentuser;
  Rx<UserModel> usermodel = UserModel(
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
  RxBool isCustomer = true.obs;
  RxString groupValue = "Customer".obs;
  RxBool isLoading = false.obs;

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

  @override
  void onInit() async {
    currentuser = Rx<User?>(FirebaseAuth.instance.currentUser);
    currentuser.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(currentuser, _setInitialScreen);
    sharedprefs = await SharedPreferences.getInstance();

    super.onInit();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() =>  SignInScreen())
        : Get.offAll(() => const DashBoardPage());
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
      final credential= await  FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.value.text.trim(),
          password: passwordController.value.text.trim());
          
      if(credential.user!=null){
        sharedprefs.setString("UserID", credential.user!.uid);
      }
          

    return true;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future signInMethod() async {
    try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.value.text.trim(),
      password: passwordController.value.text.trim());
     return true; 
} on FirebaseAuthException catch(e) {

    return e.code.toString();
}
  }

  // Future authenticateWithPhone(String phone) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phone,
  //     verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {},
  //     verificationFailed: (FirebaseAuthException error) {
  //       if (error.code == 'invalid-phone-number') {
  //         Get.snackbar("phone wrong", " Provided phone is wrong ",
  //             snackPosition: SnackPosition.BOTTOM,
  //             duration: const Duration(milliseconds: 5));
  //       } else {
  //         Get.snackbar("phone wrong", " Something went wrong please try again ",
  //             snackPosition: SnackPosition.BOTTOM,
  //             duration: const Duration(milliseconds: 5));
  //       }
  //     },
  //     codeSent: (String verificationId, int? forceResendingToken) {
  //       this.verificationId.value = verificationId;
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       this.verificationId.value = verificationId;
  //     },
  //   );
  // }

  // Future verifyOTP(String otp) async {
  //   UserCredential credential = await FirebaseAuth.instance
  //       .signInWithCredential(PhoneAuthProvider.credential(
  //           verificationId: verificationId.value, smsCode: otp));

  //   if (FirebaseAuth.instance.currentUser != null) {
  //     sharedprefs.setString("UserID", FirebaseAuth.instance.currentUser!.uid);
  //   }

  //   if (credential.user != null) {
  //     showDialog();
  //     await saveWholeDataInDatabase();
  //     Get.offAll(() => const HomeScreen());
  //   } else {
  //     Get.back();
  //   }
  // }

  Future saveDataInFirebase(photolink) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final usersCollection = FirebaseFirestore.instance.collection("users");
    var locationController = Get.find<LocationController>();
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
    Get.offAll(()=>const DashBoardPage());
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

  
    Future signOut()async {
    await FirebaseAuth.instance.signOut();
     
  }
}
