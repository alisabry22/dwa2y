
import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:get/get.dart';

import '../../Models/user_model.dart';

class HomeController extends GetxController {


   Rx<UserModel> currentUserData = UserModel(lat: 0.0, long: 0.0,).obs;
   AuthServices authController=Get.find<AuthServices>();

  @override
  void onInit() async {

   currentUserData.value=authController.currentUserData.value;
  print("home controller ${currentUserData.value.username}");
   authController.currentUserData.listen((p0) {
    currentUserData.value=p0;
   });
    super.onInit();
  }



}
