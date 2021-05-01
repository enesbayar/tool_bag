import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'classic_text.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton(
      {Key key,
      this.width : 180,
      this.height : 60,
      @required this.onPressed,
      this.text : "",
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: ClassicText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
