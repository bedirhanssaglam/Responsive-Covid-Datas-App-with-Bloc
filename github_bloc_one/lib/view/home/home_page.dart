import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc_one/core/components/custom_app_bar.dart';
import 'package:github_bloc_one/core/components/custom_text.dart';

import '../../core/components/custom_alert_dialog.dart';
import '../../core/components/custom_scaffold.dart';
import 'bloc/covid_bloc.dart';
import 'widgets/covid_card_list.dart';
import 'widgets/snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CovidBloc covidBloc;

  @override
  void initState() {
    super.initState();
    covidBloc = CovidBloc();
    covidBloc.add(FetchAllCovid());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return const CustomAlertDialog(
                  headerTitle: 'Warning',
                  content: 'Are you sure you want to log out?',
                );
              },
            );
          },
          icon: Platform.isIOS
              ? const Icon(Icons.arrow_back_ios, color: Colors.black)
              : const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_) => covidBloc,
          child: BlocListener<CovidBloc, CovidState>(
            listener: (context, state) {
              if (state is CovidError) {
                customSnackBar(context, state);
              }
            },
            child: BlocBuilder<CovidBloc, CovidState>(
              builder: (context, state) {
                if (state is CovidLoading) {
                  return Center(
                    child: Platform.isIOS
                        ? const Center(child: CupertinoActivityIndicator())
                        : const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is CovidLoaded) {
                  return CovidCardList(
                    covidModel: state.covidModel,
                  );
                } else if (state is CovidError) {
                  return const CustomText(text: 'Something went wrong.');
                } else {
                  return const CustomText(text: 'Not found.');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
