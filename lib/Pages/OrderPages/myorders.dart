import 'package:dwa2y/Controllers/OrderControllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class MyOrders extends GetView<OrderController> {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     backgroundColor: Colors.transparent,
     body: Container(
       decoration:const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                  Color.fromARGB(255, 4, 16, 89),
                    Color.fromARGB(255, 1, 15, 57),
              ]),
        ),
          child: Center(child: Text("No Orders untill now",style: GoogleFonts.roboto(color: Colors.white),)),
     ),
    );
  }
}