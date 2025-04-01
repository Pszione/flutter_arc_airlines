import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_info_model.g.dart';

@JsonSerializable()
class FlightInfoModel extends Equatable {
  final String flightNumber; // TODO: should entity with business logic
  final String airline; // TODO: should entity with business logic
  final String departureAirport; // TODO: should entity with business logic
  final String arrivalAirport; // TODO: should entity with business logic
  final DateTime departureTime; // TODO: timezones?
  final DateTime arrivalTime; // TODO: timezones?

  const FlightInfoModel({
    required this.flightNumber,
    required this.airline,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureTime,
    required this.arrivalTime,
  });

  @override
  List<Object?> get props => [
    flightNumber,
    airline,
    departureAirport,
    arrivalAirport,
    departureTime,
    arrivalTime,
  ];

  factory FlightInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FlightInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlightInfoModelToJson(this);
}
