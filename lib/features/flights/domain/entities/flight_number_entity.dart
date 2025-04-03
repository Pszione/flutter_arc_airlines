import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_number_entity.g.dart';

@JsonSerializable()
class FlightNumberEntity with EquatableMixin {
  final String? airlineCode;
  final String value;

  const FlightNumberEntity({required this.airlineCode, required this.value});

  @override
  List<Object?> get props => [airlineCode, value];

  factory FlightNumberEntity.fromJson(Map<String, dynamic> json) =>
      _$FlightNumberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FlightNumberEntityToJson(this);
}
