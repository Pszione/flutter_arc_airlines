import 'package:faker/faker.dart';

import '../../domain/domain.dart';

final _faker = Faker();

abstract class AirlineFaker {
  static AirlineEntity call() => AirlineEntity(
    id: _faker.randomGenerator.integer(1000).toString(), // TODO: move to uidGenerator
    name: _faker.company.name(),
    code: _faker.randomGenerator.string(2).toUpperCase(),
    country: _faker.address.country(),
    // logoUrl: _faker.image.image(),
  );
}
