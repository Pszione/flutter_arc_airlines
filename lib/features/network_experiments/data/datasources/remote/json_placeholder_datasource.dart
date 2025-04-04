import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../../../core/https/https.dart';

class JsonPlaceholderDatasource {
  final NetworkClientService client;

  JsonPlaceholderDatasource(this.client);

  @visibleForTesting
  Future testApiCalls() async {
    try {
      await getPosts();
      await getPost();
      await createPost();
      await updatePost();
      await deletePost();
    } catch (e, s) {
      log('DataSource error: $e', stackTrace: s);
    }
  }

  /// GET all posts
  Future<void> getPosts() async {
    final response = await client.get('https://jsonplaceholder.typicode.com/posts');
    print(response.data);
  }

  /// GET single post
  Future<void> getPost() async {
    final response = await client.get('https://jsonplaceholder.typicode.com/posts/1');
    print(response.data);
  }

  /// POST new post
  Future<void> createPost() async {
    final response = await client.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {'title': 'foo', 'body': 'bar', 'userId': 1},
    );
    print(response.data);
  }

  /// PUT update post
  Future<void> updatePost() async {
    final response = await client.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      // data: {'id': 1, 'title': 'foo', 'body': 'bar', 'userId': 1},
    );
    print(response.data);
  }

  // DELETE post
  Future<void> deletePost() async {
    final response = await client.delete('https://jsonplaceholder.typicode.com/posts/1');
    print(response.data);
  }
}
