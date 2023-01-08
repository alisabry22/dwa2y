import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class CustomButtonPrescription extends StatelessWidget {
 final String text;
 final void Function()? onPressed;

  const CustomButtonPrescription({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
                 
      style: ElevatedButton.styleFrom(backgroundColor: Constants().primaryColor,fixedSize: Size(MediaQuery.of(context).size.width*0.4, 40)),
         child: Text(text,
          style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w500)),
    );
  }
}