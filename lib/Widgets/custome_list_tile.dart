import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatelessWidget {
  String title;
  void Function()? onTap;
  Widget? leading;
  Widget? trailing;
  String subtitile;
   CustomListTile({
    Key? key,
    required this.title,
    required this.onTap,
     this.leading,
    this.trailing=  const Icon(Icons.arrow_forward),
    this.subtitile="",


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap:onTap,
      horizontalTitleGap: 0.0,
      leading:leading,
      title:Text(title,style: GoogleFonts.ubuntu( fontSize: 16, color: Colors.white), ),
      trailing: trailing,
      subtitle: Text(subtitile,style: GoogleFonts.ubuntu(color:Colors.grey),),
    );
  }
}