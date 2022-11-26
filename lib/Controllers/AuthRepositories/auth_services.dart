import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Models/user_model.dart';
import 'package:dwa2y/Pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthServices extends GetxController {
  Rx<User?>? currentuser;
  RxBool isCustomer = true.obs;
  RxString groupValue = "Customer".obs;
  RxBool isLoading=false.obs;

//TextEditing Controllers for Signup screen
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  RxString profileImagePath = "".obs;
  RxString countrycode = "EG".obs;
  RxString dialCode = "+20".obs;
  RxString verificationId = "".obs;

  @override
  void onReady() {
    currentuser = Rx<User?>(FirebaseAuth.instance.currentUser);
    currentuser!.bindStream(FirebaseAuth.instance.authStateChanges());
    //  ever(currentuser!, _setInitialScreen);

    super.onInit();
  }

  // _setInitialScreen(User? user) {
  //   user == null ? Get.offAll(() => const SignInScreen()) : const HomeScreen();
  // }

  Future pickprofileImage() async {
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      profileImagePath.value = file.path;
    } else {
      return null;
    }
  }

  Future authenticateWithPhone(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {

      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == 'invalid-phone-number') {
          Get.snackbar("phone wrong", " Provided phone is wrong ",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 5));
        } else {
          Get.snackbar("phone wrong", " Something went wrong please try again ",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 5));
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future verifyOTP(String otp) async {
    UserCredential credential = await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credential.user != null ? Get.offAll(()=>const HomeScreen()) : Get.back();
  }

  Future saveDataInFirebase(String username, String phone, String countrycode, String imagePhotoLink, String type) async {
    final usersCollection = FirebaseFirestore.instance.collection("users");
    UserModel userModel = UserModel(
        username: username,
        phone: phone,
        countrycode: countrycode,
        profileImageLink: imagePhotoLink,
        type: type);
    final jsonMap = userModel.userModelToJson();

    await usersCollection.add(jsonMap);
  }

  Future<String> uploadImageToDatabase(File profileImage) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final storage = FirebaseStorage.instance.ref("profileImages/$userId");

    await storage.putFile(profileImage);

    String downloadUrl = await storage.getDownloadURL();
    return downloadUrl;
  }

  Future SaveWholeDataInDatabase(File profileImage)async{
    String photourl=await uploadImageToDatabase(profileImage);
    await saveDataInFirebase(usernameController.text, phoneController.text, countrycode.value, photourl, groupValue.value);
  }
}
