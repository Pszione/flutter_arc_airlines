import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../../../core/https/https.dart';

class RequestResDatasource {
  final NetworkClientService client;

  RequestResDatasource(this.client);

  @visibleForTesting
  Future testApiCalls() async {
    try {
      await getUsers();
      await getUser();
      await createUser();
      await patchUser();
    } catch (e, s) {
      log('DataSource error: $e', stackTrace: s);
    }
  }

  /// GET all users
  Future<void> getUsers() async {
    final response = await client.get('https://reqres.in/api/users');
    print(response.data);
  }

  /// GET single user
  Future<void> getUser() async {
    final response = await client.get('https://reqres.in/api/users/2');
    print(response.data);
  }

  /// POST new user
  Future<void> createUser() async {
    final response = await client.post(
      'https://reqres.in/api/register',
      data: {'email': 'eve.holt@reqres.in', 'password': 'helloworld'},
    );
    print(response.data);
  }

  /// PUT update user
  Future<void> patchUser() async {
    final response = await client.patch(
      'https://reqres.in/api/users/2',
      data: {'name': 'morpheus', 'job': 'zion resident'},
    );
    print(response.data);
  }
}
