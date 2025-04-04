import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'airline_entity.g.dart';

@JsonSerializable()
class AirlineEntity extends Equatable {
  final String id;
  final String name;

  /// IATA code
  final String code;
  final String? country;

  const AirlineEntity({
    required this.id,
    required this.name,
    required this.code,
    this.country,
  });

  factory AirlineEntity.empty() =>
      const AirlineEntity(
        id: '',
        name: '',
        code: '',
        country: null,
      );

  @override
  List<Object?> get props => [id, name, code, country];

  factory AirlineEntity.fromJson(Map<String, dynamic> json) =>
      _$AirlineEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AirlineEntityToJson(this);
}
