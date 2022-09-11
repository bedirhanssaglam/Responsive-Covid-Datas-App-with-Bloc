import 'package:flutter/material.dart';

import '../../../core/components/custom_text.dart';
import '../bloc/covid_bloc.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context, CovidError state) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomText(text: state.message!),
    ),
  );
}
