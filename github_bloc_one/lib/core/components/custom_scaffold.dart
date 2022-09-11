import 'package:flutter/material.dart';
import 'package:github_bloc_one/core/constants/app_constants.dart';
import 'package:sizer/sizer.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool scrolling;
  final Color? backgroundColor;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.scrolling = false,
    this.appBar,
    this.backgroundColor = AppConstants.lightPurple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w.sp),
        child: scrolling
            ? SingleChildScrollView(
                child: body,
              )
            : body,
      ),
    );
  }
}
