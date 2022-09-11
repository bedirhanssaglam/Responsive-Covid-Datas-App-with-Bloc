import 'package:dio/dio.dart';

import '../models/covid_model.dart';
import 'covid_service.dart';

class CovidRepository {
  final covidService = CovidService(Dio());

  Future<CovidModel> fetchCovidList() {
    return covidService.fetchCovidList();
  }
}

class NetworkError extends Error {}
