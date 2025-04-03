import 'package:faker/faker.dart';
import 'package:flutter_arc_airlines/core/extensions/extensions.dart';

import '../../domain/domain.dart';

final _faker = Faker();

abstract class AirlineFaker {
  static AirlineEntity call() => AirlineEntity(
    id: _faker.guid.guid(),
    name: _faker.company.name(),
    code: _faker.stringFromWords(2),
    country: _faker.address.country(),
    // logoUrl: _faker.image.image(),
  );
}
