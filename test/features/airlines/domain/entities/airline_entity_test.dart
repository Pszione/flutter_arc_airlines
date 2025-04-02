import 'package:flutter_arc_airlines/features/airlines/airlines_imports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$AirlineEntity', () {
    final validJson = {
      'id': 'AL123',
      'name': 'Test Airline',
      'code': 'TA',
      'country': 'Test Country',
    };

    final invalidJson = {
      'id': null,
      'name': null,
      'code': null,
      'country': null,
    };

    test('createsInstanceFromValidJson', () {
      final entity = AirlineEntity.fromJson(validJson);

      expect(entity.id, 'AL123');
      expect(entity.name, 'Test Airline');
      expect(entity.code, 'TA');
      expect(entity.country, 'Test Country');
    });

    test('throwsErrorForInvalidJson', () {
      expect(
        () => AirlineEntity.fromJson(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });

    test('convertsToJsonCorrectly', () {
      final entity = AirlineEntity.fromJson(validJson);
      final json = entity.toJson();

      expect(json, validJson);
    });

    test('supportsEquatable', () {
      final entity1 = AirlineEntity.fromJson(validJson);
      final entity2 = AirlineEntity.fromJson(validJson);

      expect(entity1, entity2);
    });

    test('handlesNullCountry', () {
      final jsonWithNullCountry = {
        'id': 'AL123',
        'name': 'Test Airline',
        'code': 'TA',
        'country': null,
      };
      final entity = AirlineEntity.fromJson(jsonWithNullCountry);

      expect(entity.country, isNull);
    });
  });
}
