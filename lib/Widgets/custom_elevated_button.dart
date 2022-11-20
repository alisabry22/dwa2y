import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class customElevatedButton extends StatelessWidget {
    final double width;
  final double height;
  final void Function() onPressed;
  final String text;
  const customElevatedButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.text,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width * 0.9, height * 0.13),
          backgroundColor: Constants().btnColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
        onPressed:onPressed,
        child: Text(
          text,
          style: GoogleFonts.ubuntu(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ));
  }
}