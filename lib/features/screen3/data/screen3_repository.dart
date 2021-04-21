import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_app/commonHelper/ApiClient.dart';
import 'model/screen3_model.dart';

abstract class Screen3Repository {
  Future<Screen3Model> getMockeData();
}

class MockScreen3Repository implements Screen3Repository {
  MockScreen3Repository(this.apiClient);
  ApiClient apiClient;

  @override
  Future<Screen3Model> getMockeData() async {
    try {
/*       final url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';
      Map userMap =
          await apiClient.request(null, url, RequestMethod.GET.toString());
      var responseM = Screen1Model.fromJson(userMap);
      return responseM; */
      return await returnMockData();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  returnMockData() async {
    return Future.delayed(
      Duration(seconds: 5),
      () async {
        String str = await loadMockDataFromAsset();
        final json1 = jsonDecode(str);
        var responseM = Screen3Model.fromJson(json1);
        return responseM;
      },
    );
  }

  Future<String> loadMockDataFromAsset() async {
    return await rootBundle
        .loadString('assets/mock_data/screen3_mock_data.json');
  }
}
