import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/model/http/http_get_model.dart';

part 'http_get_store.g.dart';

class HttpGetStore = _HttpGetStore with _$HttpGetStore;

abstract class _HttpGetStore with Store {
  @observable
  List<HttpGetModel> result = [];

  _HttpGetStore() {
    getResponse();
  }

  Future<List<HttpGetModel>> getResponse() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    try {
      if (response.statusCode == 200) {
        var resultData = jsonDecode(response.body);
        //debugPrint('Result data is $resultData');
        result = resultData
            .map<HttpGetModel>((e) => HttpGetModel.fromJson(e))
            .toList();
      } else {
        debugPrint('Sorry!! Get an Error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return result;
  }
}
