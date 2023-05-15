import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../../model/http/http_post_model.dart';

part 'http_post_store.g.dart';

class HttpPostStore = _HttpPostStore with _$HttpPostStore;

abstract class _HttpPostStore with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  Future<HttpPostModel> submitData(String name, String job) async {
    final response =
        await http.post(Uri.parse('https://reqres.in/api/users'), body: {
      'name': name,
      'job': job,
    });

    var data = response.body;
    var result;
    debugPrint('Data is $data');

    if (response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      result = HttpPostModel.fromJson(responseData);
    } else {
      debugPrint('Oops!! Something went Wrong');
    }

    return result;
  }
}
