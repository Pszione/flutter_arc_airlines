// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightInfoModel _$FlightInfoModelFromJson(Map<String, dynamic> json) =>
    FlightInfoModel(
      flightNumber: FlightNumberEntity.fromJson(
        json['flightNumber'] as Map<String, dynamic>,
      ),
      airline: AirlineEntity.fromJson(json['airline'] as Map<String, dynamic>),
      departureAirport: json['departureAirport'] as String,
      arrivalAirport: json['arrivalAirport'] as String,
      departureTerminal:
          json['departureTerminal'] == null
              ? null
              : AirportTerminalEntity.fromJson(
                json['departureTerminal'] as Map<String, dynamic>,
              ),
      arrivalTerminal:
          json['arrivalTerminal'] == null
              ? null
              : AirportTerminalEntity.fromJson(
                json['arrivalTerminal'] as Map<String, dynamic>,
              ),
      departureTime: DateTime.parse(json['departureTime'] as String),
      arrivalTime: DateTime.parse(json['arrivalTime'] as String),
    );

Map<String, dynamic> _$FlightInfoModelToJson(FlightInfoModel instance) =>
    <String, dynamic>{
      'flightNumber': instance.flightNumber,
      'airline': instance.airline,
      'departureAirport': instance.departureAirport,
      'arrivalAirport': instance.arrivalAirport,
      'departureTerminal': instance.departureTerminal,
      'arrivalTerminal': instance.arrivalTerminal,
      'departureTime': instance.departureTime.toIso8601String(),
      'arrivalTime': instance.arrivalTime.toIso8601String(),
    };
