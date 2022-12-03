import 'package:dwa2y/Controllers/bottomNavigationServices/bottom_nav_controller.dart';
import 'package:dwa2y/Pages/MyAccountPages/myaccount_screen.dart';
import 'package:dwa2y/Pages/OrderPages/myorders.dart';
import 'package:dwa2y/Pages/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavigationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(
              index: controller.navBarIndex.value,
              children:const  [
                HomeScreen(),
                MyOrders(),
                MyAccountPage(),
              ],
            ),
      

        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor:const Color.fromARGB(255, 4, 16, 89),
          currentIndex:controller.navBarIndex.value ,
          onTap: (value) {
            if(value==0){
              controller.navBarIndex.value=0;
            }else if (value==1){
              controller.navBarIndex.value=1;

            }else{
             controller.navBarIndex.value=2;

            }
          },
          
          items: [
          BottomNavigationBarItem(

              label: "Home", icon: const Icon(FontAwesomeIcons.houseMedical)),
          BottomNavigationBarItem(
              label: "Orders", icon: Icon(FontAwesomeIcons.moneyCheck)),
          BottomNavigationBarItem(
              label: "My Account", icon: Icon(FontAwesomeIcons.person)),
        ]),
      );
    });
  }
}
