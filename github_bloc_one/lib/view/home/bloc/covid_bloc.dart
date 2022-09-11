import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/covid_model.dart';
import '../service/covid_repository.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final CovidRepository covidRepository = CovidRepository();

    on<FetchAllCovid>((event, emit) async {
      try {
        emit(CovidLoading());
        final covidList = await covidRepository.fetchCovidList();
        emit(CovidLoaded(covidList));
        if (covidList.error != null) {
          emit(CovidError(covidList.error));
        }
      } on NetworkError {
        emit(
          const CovidError("Failed to fetch data. Is your device online?"),
        );
      }
    });
  }
}
