// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airline_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirlineEntity _$AirlineEntityFromJson(Map<String, dynamic> json) =>
    AirlineEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AirlineEntityToJson(AirlineEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'country': instance.country,
    };
