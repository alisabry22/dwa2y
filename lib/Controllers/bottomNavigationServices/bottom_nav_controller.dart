import 'package:get/get.dart';

class BottomNavigationController extends GetxController{
 RxInt navBarIndex=0.obs;

 void changeTabIndex(index){
  navBarIndex.value=index;
 }
}