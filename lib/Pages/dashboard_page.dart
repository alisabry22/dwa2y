import 'package:dwa2y/Controllers/bottomNavigationServices/bottom_nav_controller.dart';
import 'package:dwa2y/Pages/MyAccountPages/myaccount_screen.dart';
import 'package:dwa2y/Pages/OrderPages/myorders.dart';
import 'package:dwa2y/Pages/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoardPage extends GetView<BottomNavigationController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
          
        navBarStyle: NavBarStyle.simple,
  
        controller: controller.persistentTabController, screens:const [

          HomeScreen(),
          MyOrders(),
          MyAccountPage(),
        ],
      
        items: [
          PersistentBottomNavBarItem(icon:const Icon(Icons.home),title: "Home"),
          PersistentBottomNavBarItem(icon:const Icon(Icons.payment),title: "Orders"),
          PersistentBottomNavBarItem(icon:const Icon(Icons.account_balance),title: "MyAccount"),
        ],
        
        );
      
  }
}
