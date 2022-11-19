import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices extends GetxController{
late Rx<User?> currentuser;
@override
  void onInit() {
    currentuser.bindStream(FirebaseAuth.instance.authStateChanges());
    if(currentuser!=null){
      
    }
    super.onInit();
    
  }

  
}