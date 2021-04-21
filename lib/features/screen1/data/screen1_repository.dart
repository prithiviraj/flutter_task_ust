import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_app/commonHelper/ApiClient.dart';
import 'model/screen1_model.dart';

abstract class Screen1Repository {
  Future<Screen1Model> getMockeData();
}

class MockScreen1Repository implements Screen1Repository {
  MockScreen1Repository(this.apiClient);
  ApiClient apiClient;

  @override
  Future<Screen1Model> getMockeData() async {
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
        var responseM = Screen1Model.fromJson(json1);
        return responseM;
      },
    );
  }

  Future<String> loadMockDataFromAsset() async {
    return await rootBundle
        .loadString('assets/mock_data/carousel_mock_data.json');
  }
}