import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart' show Faker;

import '../../../../../core/core.dart';
import '../../../../flights/data/data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> refreshFlightData() async {
    await fetchFlightData();
  }

  Future<void> fetchFlightData() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      await simulateApiDelay();

      final departureFlightInfo = FlightInfoFaker.call();
      final arrivalFlightInfo = FlightInfoFaker.call();
      final confirmationCode = Faker().stringFromWords(5).toString(); // TODO

      emit(
        state.copyWith(
          status: HomeStatus.success,
          departureFlightInfo: departureFlightInfo,
          arrivalFlightInfo: arrivalFlightInfo,
          confirmationCode: confirmationCode,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: e.toString()));
    }
  }
}
