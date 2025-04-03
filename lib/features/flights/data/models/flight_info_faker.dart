import 'package:faker/faker.dart';
import 'package:flutter_arc_airlines/core/extensions/extensions.dart';
import 'package:flutter_arc_airlines/features/flights/data/data.dart';

import '../../../airlines/airlines_imports.dart';
import '../../domain/domain.dart';

final _faker = Faker();

abstract class FlightInfoFaker {
  static FlightInfoModel call() => FlightInfoModel(
    airline: AirlineFaker.call(),
    flightNumber: FlightNumberEntity(
      value: _faker.stringFromWords(5),
      airlineCode: _faker.stringFromWords(2),
    ),
    departureAirport: _faker.stringFromWords(3),
    arrivalAirport: _faker.stringFromWords(3),
    departureTerminal: AirportTerminalEntity(
      name: _faker.randomGenerator.integer(30, min: 1).toString(),
      gate:
          _faker.randomGenerator.boolean()
              ? _faker.randomGenerator.integer(250, min: 1).toString()
              : null,
    ),
    arrivalTerminal: AirportTerminalEntity(
      name:
          _faker.randomGenerator.boolean()
              ? _faker.randomGenerator.integer(30, min: 1).toString()
              : null,
      gate:
          (_faker.randomGenerator.boolean() && _faker.randomGenerator.boolean())
              ? _faker.randomGenerator.integer(250, min: 1).toString()
              : null,
    ),
    departureTime: _faker.date.dateTime(),
    arrivalTime: _faker.date.dateTime(),
  );
}
