// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_number_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightNumberEntity _$FlightNumberEntityFromJson(Map<String, dynamic> json) =>
    FlightNumberEntity(
      airlineCode: json['airlineCode'] as String?,
      value: json['value'] as String,
    );

Map<String, dynamic> _$FlightNumberEntityToJson(FlightNumberEntity instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'value': instance.value,
    };
