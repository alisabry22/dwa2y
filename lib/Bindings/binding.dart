import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Controllers/AuthRepositories/location_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings{
  @override
  void dependencies() {
    Get.put( AuthServices() );
    Get.put(LocationController());
  }

}