import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.backgroundColor = Colors.white,
    this.textStyle,
    required this.press,
    required this.text,
    this.textColor = Colors.white,
  }) : super(key: key);

  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback press;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        textStyle: GoogleFonts.poppins(),
      ),
      onPressed: press,
      child: CustomText(
        text: text,
        textStyle: TextStyle(color: textColor),
      ),
    );
  }
}
