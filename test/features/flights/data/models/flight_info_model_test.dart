import 'package:flutter_arc_airlines/features/flights/flights_imports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$FlightInfoModel', () {
    final validJson = {
      'flightNumber': 'AB123',
      'airline': 'AirlineName',
      'departureAirport': 'JFK',
      'arrivalAirport': 'LAX',
      'departureTime': '2023-10-10T10:00:00.000Z',
      'arrivalTime': '2023-10-10T14:00:00.000Z',
    };

    final invalidJson = {
      'flightNumber': null,
      'airline': null,
      'departureAirport': null,
      'arrivalAirport': null,
      'departureTime': null,
      'arrivalTime': null,
    };

    test('createsInstanceFromValidJson', () {
      final model = FlightInfoModel.fromJson(validJson);

      expect(model.flightNumber, 'AB123');
      expect(model.airline, 'AirlineName');
      expect(model.departureAirport, 'JFK');
      expect(model.arrivalAirport, 'LAX');
      expect(model.departureTime, DateTime.parse('2023-10-10T10:00:00.000Z'));
      expect(model.arrivalTime, DateTime.parse('2023-10-10T14:00:00.000Z'));
    });

    test('throwsErrorForInvalidJson', () {
      expect(
        () => FlightInfoModel.fromJson(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });

    test('convertsToJsonCorrectly', () {
      final model = FlightInfoModel.fromJson(validJson);
      final json = model.toJson();

      expect(json, validJson);
    });

    test('supportsEquatable', () {
      final model1 = FlightInfoModel.fromJson(validJson);
      final model2 = FlightInfoModel.fromJson(validJson);

      expect(model1, model2);
    });
  });
}
