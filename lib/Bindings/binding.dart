import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:get/get.dart';

class Binding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthServices(),fenix:true );
    // TODO: implement dependencies
  }

}