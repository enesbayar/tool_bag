import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassicText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextDecoration textDecoration;
  final double letterSpacing;
  final FontWeight fontWeight;

  const ClassicText(
      {Key key,
      @required this.text,
      this.color,
      this.fontSize: 14.0,
      this.textDecoration,
      this.letterSpacing,
      this.fontWeight,})
      : assert(text!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: GoogleFonts.montserrat(
        textStyle: 
          TextStyle(
            color: color,
            fontSize: fontSize,
            decoration: textDecoration,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
          )
      )
    );
  }
}
