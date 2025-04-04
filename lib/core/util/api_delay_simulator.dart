import 'package:faker/faker.dart';

final _faker = Faker();

/// Simulates a delay for API calls to mimic network real-world scenarios.
///
/// Will delay for a random duration between 400ms and 1300ms if no delay is provided.
Future<void> simulateApiDelay({Duration? delay}) async {
  await Future.delayed(
    delay ?? Duration(milliseconds: _faker.randomGenerator.integer(1300, min: 400)),
  );
}
