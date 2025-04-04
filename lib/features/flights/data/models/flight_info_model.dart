import 'package:equatable/equatable.dart';
import 'package:flutter_arc_airlines/features/airlines/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/domain.dart';

part 'flight_info_model.g.dart';

@JsonSerializable()
class FlightInfoModel extends Equatable {
  final FlightNumberEntity flightNumber;
  final AirlineEntity airline;
  final String departureAirport; // TODO: should entity with business logic
  final String arrivalAirport; // TODO: should entity with business logic
  final AirportTerminalEntity? departureTerminal;
  final AirportTerminalEntity? arrivalTerminal;
  final DateTime departureTime; // TODO: timezones?
  final DateTime arrivalTime; // TODO: timezones?

  const FlightInfoModel({
    required this.flightNumber,
    required this.airline,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureTerminal,
    required this.arrivalTerminal,
    required this.departureTime,
    required this.arrivalTime,
  });

  factory FlightInfoModel.empty() => FlightInfoModel(
    flightNumber: FlightNumberEntity.empty(),
    airline: AirlineEntity.empty(),
    departureAirport: '',
    arrivalAirport: '',
    departureTerminal: null,
    arrivalTerminal: null,
    departureTime: DateTime.now(),
    arrivalTime: DateTime.now(),
  );

  String getAirport(bool isDeparture) => isDeparture ? departureAirport : arrivalAirport;
  DateTime getFlightTime(bool isDeparture) =>
      isDeparture ? departureTime.toLocal() : arrivalTime.toLocal();
  DateTime getFlightBoardingTime() => departureTime.subtract(const Duration(minutes: 45));
  AirportTerminalEntity? getTerminal(bool isDeparture) =>
      isDeparture ? departureTerminal : arrivalTerminal;

  @override
  List<Object?> get props => [
    flightNumber,
    airline,
    departureAirport,
    arrivalAirport,
    departureTime,
    arrivalTime,
  ];

  factory FlightInfoModel.fromJson(Map<String, dynamic> json) => _$FlightInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlightInfoModelToJson(this);
}
