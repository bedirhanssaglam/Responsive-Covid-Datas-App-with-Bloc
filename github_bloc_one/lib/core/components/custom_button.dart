import 'package:flutter/material.dart';
import 'package:github_bloc_one/core/constants/app_constants.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    required this.press,
    this.buttonColor = AppConstants.orange,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget? child;
  final Color? buttonColor;
  final VoidCallback press;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: buttonColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide.none,
          ),
        ),
        child: child,
      ),
    );
  }
}
