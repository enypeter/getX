import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://reqres.in/api/';
const login = 'login';
const userList = 'users?page=1';

class Request {
  final String url;
  final dynamic body;

  Request({this.url, this.body});

  Future<http.Response> post() {
    return http.post(baseUrl + url, body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() {
    return http.get(baseUrl + url).timeout(Duration(minutes: 2));
  }
}

//
// class ApiDocsDio {
//   static headers(String token) {
//     return Options(headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: 'Bearer $token',
//     });
//   }
//
//   static Dio getHttp() {
//     Dio dio;
//     if (dio == null) {
//       dio = new Dio();
//     }
//     return dio;
//   }
//
//   static makePostRequest({url, data, token}) async {
//     var headers = ApiDocs.headers(token);
//     return await ApiDocs.getHttp().post(url, data: data, options: headers);
//   }
//
//
//   static makeGetRequest({url, data, token}) async {
//     var headers = ApiDocs.headers(token);
//     return await ApiDocs.getHttp()
//         .get(url, queryParameters: data, options: headers);
//   }
//
//   static handleErrors(DioError e) {
//     print(e.message);
//     if (e.type == DioErrorType.RESPONSE) {
//       if (e.response.data is String) {
//         return e.response.data;
//       }
//
//       return e.response.data['errors'] != null
//           ? e.response.data['errors'][0]
//           : e.response.data['message'];
//     } else if (e.type == DioErrorType.DEFAULT) {
//       print(e.error);
//       return e.error != null ? e.error.toString() : e.message;
//     } else {
//       // Something happened in setting up or sending the request that triggered an Error
//       return e.message;
//     }
//   }
//
//   static isRequestSuccessful(int statusCode) {
//     return statusCode >= 200 && statusCode < 300;
//   }
// }
