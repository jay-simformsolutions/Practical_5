import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../../model/http/http_post_model.dart';

part 'http_update_store.g.dart';

class HttpUpdateStore = _HttpUpdateStore with _$HttpUpdateStore;

abstract class _HttpUpdateStore with Store {
  Future<HttpPostModel> updateData(String name, String job) async {
    final response =
        await http.patch(Uri.https('reqres.in', '/api/users/1'), body: {
      'name': name,
      'job': job,
    });

    var data = response.body;
    var result;
    debugPrint('Data is updated $data');

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      result = HttpPostModel.fromJson(responseData);
    } else {
      debugPrint('Oops!! Something went Wrong');
    }

    return result;
  }
}
