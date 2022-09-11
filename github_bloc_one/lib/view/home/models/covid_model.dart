import 'countries_model.dart';
import 'covid_data_model.dart';

class CovidModel {
  CovidDataModel? global;
  List<CountriesModel>? countries;
  String? date;
  String? error;

  CovidModel({this.global, this.countries, this.date});

  CovidModel.withError(String errorMessage) {
    error = errorMessage;
  }

  CovidModel.fromJson(Map<String, dynamic> json) {
    global =
        json['Global'] != null ? CovidDataModel.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countries = [];
      json['Countries'].forEach((e) {
        countries!.add(CountriesModel.fromJson(e));
      });
    }
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (global != null) {
      data['Global'] = global!.toJson();
    }
    if (countries != null) {
      data['Countries'] = countries!.map((e) => e.toJson()).toList();
    }
    data['Date'] = date;
    return data;
  }
}
