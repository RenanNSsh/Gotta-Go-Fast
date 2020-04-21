import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final int maxLines;
  const TitleText(
      {Key key,
      this.text,
      this.maxLines,
      this.fontSize = 18,
      this.color = const Color(0xff1d2635),
      this.fontWeight = FontWeight.w800
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(maxLines != null){
      return AutoSizeText(text,
        maxLines: maxLines,
        style: GoogleFonts.muli(
            fontSize: fontSize, fontWeight: fontWeight, color: color));  
    }
    return AutoSizeText(text,
        style: GoogleFonts.muli(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}