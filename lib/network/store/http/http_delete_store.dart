import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'http_delete_store.g.dart';

class HttpDeleteStore = _HttpDeleteStore with _$HttpDeleteStore;

abstract class _HttpDeleteStore with Store {
  FutureOr<void> deleteResponse(String id) async {
    final response = await http.delete(Uri.https('reqres.in', '/api/users/1'));

    if (response.statusCode == 204) {
      //var responseData = jsonDecode(response.body);
      //result = HttpPostModel.fromJson(responseData);
      debugPrint('Post is deleted');
    } else {
      debugPrint('Oops!! Something went Wrong');
    }
  }
}
