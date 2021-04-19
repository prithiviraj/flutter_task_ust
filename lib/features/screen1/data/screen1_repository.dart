import 'dart:async';

import 'package:dio/dio.dart';
import 'model/screen1_model.dart';

abstract class Screen1Repository {
  Future<List<Screen1Model>> getMockeData();
}

class MockScreen1Repository implements Screen1Repository {
  MockScreen1Repository(this.client);
  final Dio client;

  @override
  Future<List<Screen1Model>> getMockeData() async {
    try {
      return Future.delayed(
        Duration(seconds: 5),
        () {
          return [];
        },
      );
/*       final url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';
      final response = await client.get(url);
      final data = List<Screen1Model>.of(
        response.data['results'].map<Screen1Model>(
          (json) => Screen1Model(
            title: json['title'],
            urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
          ),
        ),
      );
      return data; */
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
