import 'package:flutter_arc_airlines/features/flights/flights_imports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$FlightNumberEntity', () {
    final validJson = {'airlineCode': 'TA', 'value': '1234'};

    final invalidJson = {'airlineCode': null, 'value': null};

    test('createsInstanceFromValidJson', () {
      final entity = FlightNumberEntity.fromJson(validJson);
      expect(entity.airlineCode, 'TA');
      expect(entity.value, '1234');
    });

    test('throwsErrorForInvalidJson', () {
      expect(() => FlightNumberEntity.fromJson(invalidJson), throwsA(isA<TypeError>()));
    });

    test('convertsToJsonCorrectly', () {
      final entity = FlightNumberEntity.fromJson(validJson);
      final json = entity.toJson();
      expect(json, validJson);
    });

    test('supportsEquatable', () {
      final entity1 = FlightNumberEntity.fromJson(validJson);
      final entity2 = FlightNumberEntity.fromJson(validJson);
      expect(entity1, entity2);
    });

    test('handlesNullAirlineCode', () {
      final jsonWithNullAirlineCode = {'airlineCode': null, 'value': '1234'};
      final entity = FlightNumberEntity.fromJson(jsonWithNullAirlineCode);
      expect(entity.airlineCode, isNull);
      expect(entity.value, '1234');
    });
  });
}
