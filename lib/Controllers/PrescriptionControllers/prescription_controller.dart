import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionController extends GetxController{

Rx<String> pickedImage="".obs;


  Future pickPrescriptionFromGallery()async{
    XFile? file;
  file =await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 90);
  if(file!=null){
    pickedImage.value=file.path;

  }

  }
}