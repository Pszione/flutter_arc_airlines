import 'package:faker/faker.dart';

extension FakerExtensions on Faker {
  String stringFromWords(int length) =>
      randomGenerator.fromCharSet('ABCDEFGHIJKLMONPQESTUVWXYZ', length);
}
