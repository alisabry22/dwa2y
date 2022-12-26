
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {

final String hintText;
String? Function(String?)? validator;
TextEditingController controller;
Widget? suffixIcon;
bool obscureValue;
Function(String)? onchanged;

   CustomTextField({super.key, 
    required this.hintText,
    required this.validator,
    required this.controller,
    this.suffixIcon,
    this.obscureValue=false,
    this.onchanged,
  });
   

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      onChanged:onchanged ,
      validator:validator ,
      obscureText: obscureValue,
      decoration: InputDecoration(
        suffixIcon:suffixIcon ,
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