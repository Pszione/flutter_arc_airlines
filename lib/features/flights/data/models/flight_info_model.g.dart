// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightInfoModel _$FlightInfoModelFromJson(Map<String, dynamic> json) =>
    FlightInfoModel(
      flightNumber: json['flightNumber'] as String,
      airline: json['airline'] as String,
      departureAirport: json['departureAirport'] as String,
      arrivalAirport: json['arrivalAirport'] as String,
      departureTime: DateTime.parse(json['departureTime'] as String),
      arrivalTime: DateTime.parse(json['arrivalTime'] as String),
    );

Map<String, dynamic> _$FlightInfoModelToJson(FlightInfoModel instance) =>
    <String, dynamic>{
      'flightNumber': instance.flightNumber,
      'airline': instance.airline,
      'departureAirport': instance.departureAirport,
      'arrivalAirport': instance.arrivalAirport,
      'departureTime': instance.departureTime.toIso8601String(),
      'arrivalTime': instance.arrivalTime.toIso8601String(),
    };
