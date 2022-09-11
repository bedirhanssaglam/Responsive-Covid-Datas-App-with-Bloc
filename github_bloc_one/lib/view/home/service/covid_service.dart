import 'package:dio/dio.dart';
import 'package:github_bloc_one/core/constants/app_constants.dart';

import '../models/covid_model.dart';

abstract class ICovidService {
  final Dio dio;

  ICovidService(this.dio);

  Future<CovidModel> fetchCovidList();
}

class CovidService extends ICovidService {
  final Dio _dio = Dio();

  CovidService(super.dio);

  @override
  Future<CovidModel> fetchCovidList() async {
    try {
      var response = await _dio.get(AppConstants.baseUrl);
      return CovidModel.fromJson(response.data);
    } catch (e) {
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
}
