import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Models/user_model.dart';
import 'package:dwa2y/Pages/AuthPages/signin_screen.dart';
import 'package:dwa2y/Pages/home_screen.dart';
import 'package:dwa2y/Pages/introductionscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthServices extends GetxController {

 late Rx<User?> currentuser;
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
  RxBool obscurepassword=true.obs;

  @override
  void onInit() {
    currentuser = Rx<User?>(FirebaseAuth.instance.currentUser);
    currentuser.bindStream(FirebaseAuth.instance.authStateChanges());
      ever(currentuser, _setInitialScreen);
      print(currentuser.value);
          super.onInit();


  
  }

   _setInitialScreen(User? user) {
   
     user == null ? Get.offAll(() => const IntroductionPage()) : const HomeScreen();
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
        
    if(credential.user!=null){
      showDialog();
      await saveWholeDataInDatabase();
      Get.offAll(()=>const HomeScreen());
    }else{

      Get.back();
    }
  }

  Future saveDataInFirebase(photolink) async {
    final userId=FirebaseAuth.instance.currentUser!.uid;
    final usersCollection = FirebaseFirestore.instance.collection("users");
    
    UserModel userModel = UserModel(
        username: usernameController.text,
        phone: phoneController.text,
        countrycode: countrycode.value,
        profileImageLink: photolink,
        type: groupValue.value,
        lat: "",
        long: "",
        );
    final jsonMap = userModel.userModelToJson();

    await usersCollection.doc(userId).set(jsonMap);
  }

  Future<String> uploadImageToDatabase() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final storage = FirebaseStorage.instance.ref("profileImages/$userId");
    File profileImageToUpload=File(profileImagePath.value);
    await storage.putFile(profileImageToUpload);

    String downloadUrl = await storage.getDownloadURL();
    return downloadUrl;
  }

  Future saveWholeDataInDatabase()async{
    showDialog();
    String photourl=await uploadImageToDatabase();
    await saveDataInFirebase(photourl);
  }

  void showDialog(){

    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:const [
              CircularProgressIndicator(),
              Text("Loading...")
            ],
          ),
        ),
      ),
    );
  }

  void signOut()async{
    await FirebaseAuth.instance.signOut();
    Get.offAll(()=>const SignInScreen());
  }
}
