import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'custom_text.dart';
import 'custom_text_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.headerTitle,
    required this.content,
  }) : super(key: key);

  final String headerTitle;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(text: headerTitle),
      content: CustomText(text: content),
      actions: <Widget>[
        CustomTextButton(
          press: () {
            context.router.pop();
          },
          text: 'Cancel',
          backgroundColor: Colors.white,
          textColor: AppConstants.orange,
        ),
        CustomTextButton(
          press: () {
            context.router.navigateBack();
          },
          text: 'Yes',
          backgroundColor: AppConstants.orange,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
