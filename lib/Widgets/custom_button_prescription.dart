import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonPrescription extends StatelessWidget {
  final String text;
  Color? backgroundColor;
  final void Function()? onPressed;

   CustomButtonPrescription({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor=Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 40)),
      child: Text(text,
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }
}
