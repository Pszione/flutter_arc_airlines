import 'package:faker/faker.dart';
import 'package:flutter_arc_airlines/features/flights/data/data.dart';

import '../../../airlines/airlines_imports.dart';
import '../../domain/domain.dart';

final _faker = Faker();

abstract class FlightInfoFaker {
  static FlightInfoModel call() => FlightInfoModel(
    airline: AirlineFaker.call(),
    flightNumber: FlightNumberEntity(
      value: _faker.randomGenerator.string(5).toUpperCase(),
      airlineCode: _faker.randomGenerator.string(2).toUpperCase(),
    ),
    departureAirport: _faker.randomGenerator.string(3).toUpperCase(),
    arrivalAirport: _faker.randomGenerator.string(3).toUpperCase(),
    departureTime: _faker.date.dateTime(),
    arrivalTime: _faker.date.dateTime(),
  );
}
