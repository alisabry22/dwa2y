import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customTextField extends StatelessWidget {

final String hintText;

   customTextField({
    required this.hintText,
    Key? key,
  });
   

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}