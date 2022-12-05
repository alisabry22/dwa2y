import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Controllers/AuthRepositories/home_controller.dart';
import 'package:dwa2y/Controllers/GooglemapControllers/google_map_services.dart';
import 'package:dwa2y/Controllers/LocationController/location_controller.dart';
import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Controllers/bottomNavigationServices/bottom_nav_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings{
  @override
  void dependencies() {
    Get.put( AuthServices() );
    Get.put(LocationController());
    Get.lazyPut(()=> HomeController());
    Get.lazyPut(()=> BottomNavigationController());
    Get.lazyPut(()=> MyAccountController());
    Get.lazyPut(()=> GoogleMapServicers());
  }

}