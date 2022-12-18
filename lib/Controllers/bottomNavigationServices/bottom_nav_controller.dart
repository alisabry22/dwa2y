import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigationController extends GetxController{
 RxInt navBarIndex=0.obs;

 PersistentTabController persistentTabController=PersistentTabController(initialIndex: 0);

 void changeTabIndex(index){
  navBarIndex.value=index;
 }
}