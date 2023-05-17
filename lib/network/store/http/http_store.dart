import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/model/http/http_model.dart';

part 'http_store.g.dart';

class HttpStore = _HttpStore with _$HttpStore;

abstract class _HttpStore with Store {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  ObservableList<HttpModel> result = ObservableList.of([]);

  _HttpStore() {
    getResponse();
  }

  String url =
      'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile.json';

  Future<List<HttpModel>> getResponse() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    try {
      if (response.statusCode == 200) {
        var resultData = jsonDecode(response.body) as Map<String, dynamic>;
        debugPrint('Result data is $resultData');
        resultData.forEach((profileId, profileData) {
          result.add(HttpModel.fromJson(profileData, profileId));
        });
        debugPrint('result is $result');
      } else {
        debugPrint('Sorry!! Get an Error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return result;
  }

  // Future<void> getResponseOnRefresh() async {
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {'Content-Type': 'application/json'},
  //   );
  //
  //   try {
  //     if (response.statusCode == 200) {
  //       var resultData = jsonDecode(response.body) as Map<String, dynamic>;
  //       debugPrint('Result data is $resultData');
  //       resultData.forEach((profileId, profileData) {
  //         result.add(HttpModel.fromJson(profileData, profileId));
  //       });
  //       debugPrint('result is $result');
  //     } else {
  //       debugPrint('Sorry!! Get an Error');
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future<HttpModel> postData(HttpModel httpModel) async {
    var postResult;

    try {
      Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          httpModel.toJson(),
        ),
      );
      if (response.statusCode == 201) {
        postResult = json.decode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return postResult;
  }

  Future<void> patchData(HttpModel httpModel, String userId) async {
    String updateURL =
        'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile/$userId.json';
    debugPrint('Updated URL is $updateURL');
    final response = await http.patch(Uri.parse(updateURL),
        body: json.encode(httpModel.toJson()));

    var data = response.body;
    HttpModel result;
    debugPrint('Data is updated $data');

    try {
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        debugPrint('Updated data is $responseData');
        result = HttpModel.fromJson(responseData);
        debugPrint('Updated result is $result');
      } else {
        debugPrint('Oops!! Something went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> putData(HttpModel httpModel) async {
    final response =
        await http.patch(Uri.parse(url), body: json.encode(httpModel.toJson()));

    var data = response.body;
    HttpModel result;
    debugPrint('Data is updated $data');

    try {
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        debugPrint('Updated data is $responseData');
        result = HttpModel.fromJson(responseData);
        debugPrint('Updated result is $result');
      } else {
        debugPrint('Oops!! Something went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteUser(String userId) async {
    final src =
        'https://api-experiment-a08fa-default-rtdb.firebaseio.com/userprofile/$userId.json';

    try {
      Response response = await delete(Uri.parse(src));

      if (response.statusCode == 200) {
        debugPrint('Deleted');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void fillPatchController(int index) {
    firstNameController.text = result[index].firstName;
    lastNameController.text = result[index].lastName;
    emailController.text = result[index].email;
  }
}
