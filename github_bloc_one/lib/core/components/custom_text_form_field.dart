import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.isPassword = false,
    this.onSaved,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.textStyle,
    this.fillColor = AppConstants.lightGrey,
    this.suffixIconData,
    this.radius = 10,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool? isPassword;
  final Function(String?)? onSaved;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? textStyle;
  final Color? fillColor;
  final IconData? suffixIconData;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isPassword!,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(textStyle: textStyle),
        filled: true,
        fillColor: fillColor,
        suffixIcon: Icon(suffixIconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
