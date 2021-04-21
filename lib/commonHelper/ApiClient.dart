import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_app/constant/Constants.dart';

abstract class ApiClient {
  Future<Map> request(Map body, String url, String method);
}

final headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  "Accept": "*/*"
};

enum RequestMethod { POST, GET, PUT, DELETE }

class ApiProviderImp implements ApiClient {
  ApiProviderImp();
  Future<Map> request(Map body, String url, String method) async {
    String reqUrl = url;
    log("URL->" + reqUrl);
    Response response = await createClient(method).request(
      url,
      queryParameters: body,
    );
    return handleResponse(response);
  }

  Map handleResponse(Response response) {
    if (response.statusCode == 200) {
      Map responseBody = response.data;
      print(responseBody.toString());
      return responseBody;
    } else {
      return null;
    }
  }

  Dio createClient(String method) {
    Dio dio = new Dio(BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
      connectTimeout: Constants.connectTimeout,
      receiveTimeout: Constants.receiveTimeout,
      headers: headers,
      method: method.toString().split('.').last,
    ));
    return dio;
  }
}
