import 'package:get/get.dart';

class AuthServices extends GetxController{
 //Rx<User?> currentuser;
RxBool isCustomer=true.obs;
RxString groupValue="Customer".obs;
@override
  void onInit() {
   // currentuser.bindStream(FirebaseAuth.instance.authStateChanges());

    super.onInit();
    
  }

  
}