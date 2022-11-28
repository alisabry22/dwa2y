import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar:AppBar(
          title: Text("Welcome , ",
              style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          leading: const BackButton(color: Colors.white),
          backgroundColor: Constants().primaryColor.withOpacity(0.6),
          elevation: 0,
          actions: [
            Row(children: [
              TextButton(onPressed: (){
                AuthServices().signOut();
              }, child:Text("Signout"))
            ],),
          ],
        ) ,
        body: Container(
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Constants().primaryColor.withOpacity(0.6),
                    Constants().primaryColor.withOpacity(0.3),
                  ]),
            ),
        ),
    );
  }
}