import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionController extends GetxController{

Rx<String> pickedImage="".obs;
  var accountController=Get.find<AuthServices>();

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
  }
  Future pickPrescriptionFromGallery()async{
    XFile? file;
  file =await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 90);
  if(file!=null){
    pickedImage.value=file.path;

  }

  }

    Future pickPrescriptionFromCamera()async{
    XFile? file;
  file =await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 90);
  if(file!=null){
    pickedImage.value=file.path;

  }

  void showBottomSheet(){
   
  }

  }
}