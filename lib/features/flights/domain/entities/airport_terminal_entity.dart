import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'airport_terminal_entity.g.dart';

@JsonSerializable()
class AirportTerminalEntity with EquatableMixin {
  final String? name;
  final String? gate;

  AirportTerminalEntity({this.name, this.gate});

  @override
  List<Object?> get props => [name, gate];

  factory AirportTerminalEntity.fromJson(Map<String, dynamic> json) =>
      _$AirportTerminalEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AirportTerminalEntityToJson(this);
}
