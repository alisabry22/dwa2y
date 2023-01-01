import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Account Setting",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 16, 89),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 4, 16, 89),
                Color.fromARGB(255, 1, 15, 57),
              ]),
        ),
        child: Column(children: [
          

        ]),
      ),
    );
  }
}
