import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';
import 'custom_text.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends AppBar {
  final String? textTitle;
  final Widget? leading;

  CustomAppBar({
    Key? key,
    this.textTitle = 'Covid Counter',
    this.leading,
  }) : super(key: key);

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: widget.leading,
      title: widget.textTitle != null
          ? CustomText(
              text: widget.textTitle!,
              textStyle: GoogleFonts.poppins(
                color: AppConstants.deepPurple,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
