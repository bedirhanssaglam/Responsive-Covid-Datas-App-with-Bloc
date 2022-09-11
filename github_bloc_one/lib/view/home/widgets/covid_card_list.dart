import 'package:flutter/material.dart';
import 'package:github_bloc_one/core/constants/app_constants.dart';

import '../../../core/components/custom_text.dart';
import '../models/covid_model.dart';
import 'package:sizer/sizer.dart';

class CovidCardList extends StatefulWidget {
  const CovidCardList({
    Key? key,
    required this.covidModel,
  }) : super(key: key);

  final CovidModel covidModel;

  @override
  State<CovidCardList> createState() => _CovidCardListState();
}

class _CovidCardListState extends State<CovidCardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.covidModel.countries!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            color: AppConstants.lightOrange,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  CustomText(
                    text:
                        "Country: ${widget.covidModel.countries![index].country}",
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomText(
                    text:
                        "Total Confirmed: ${widget.covidModel.countries![index].totalConfirmed}",
                    textStyle: TextStyle(fontSize: 10.sp),
                  ),
                  CustomText(
                    text:
                        "Total Deaths: ${widget.covidModel.countries![index].totalDeaths}",
                    textStyle: TextStyle(fontSize: 10.sp),
                  ),
                  CustomText(
                    text:
                        "Total Recovered: ${widget.covidModel.countries![index].totalRecovered}",
                    textStyle: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
