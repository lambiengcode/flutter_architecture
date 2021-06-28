import 'package:flutter_architecture/src/providers/user_provider.dart';
import 'package:flutter_architecture/src/repositories/api_routes.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart' as diox;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'dart:async';

class BaseRepository {
  var dio = diox.Dio(diox.BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  )); // with default Options

  Future<diox.Response<dynamic>> downloadFile(
      String url, String path, Function onReceive) async {
    var response = await dio.download(
      url,
      path,
      options: getOptions(),
      onReceiveProgress: onReceive(),
    );
    return response;
  }

  Future<diox.Response<dynamic>> sendFormData(
    String gateway,
    diox.FormData formData,
    Function onSend,
  ) async {
    var response = await dio.post(
      gateway,
      data: formData,
      options: getOptions(),
      onSendProgress: onSend(),
    );
    return response;
  }

  Future<diox.Response<dynamic>> postRoute(String gateway, Object body) async {
    var response = await dio.post(
      gateway,
      data: body,
    );
    printEndpoint('POST', gateway);
    return response;
  }

  Future<diox.Response<dynamic>> putRoute(String gateway, Object body) async {
    var response = await dio.put(
      gateway,
      data: body,
      options: getOptions(),
    );
    printEndpoint('PUT', gateway);
    return response;
  }

  Future<diox.Response<dynamic>> getRoute(String gateway, String params) async {
    var response = await dio.get(
      gateway + params,
      options: getOptions(),
    );
    printEndpoint('GET', gateway);
    printResponse(response);
    return response;
  }

  Future<diox.Response<dynamic>> deleteRoute(
      String gateway, Object body) async {
    var response = await dio.delete(
      gateway,
      data: body,
      options: getOptions(),
    );
    printEndpoint('DELETE', gateway);
    return response;
  }

  diox.Options getOptions() {
    return diox.Options(
      headers: {
        'Authorization':
            'Bearer ${Provider.of<UserProvider>(getx.Get.context!, listen: false).user.accessToken}',
      },
    );
  }

  printEndpoint(String method, String endpoint) {
    print('${method.toUpperCase()}: $endpoint');
  }

  printResponse(diox.Response<dynamic> response) {
    print('StatusCode: ${response.statusCode}');
    print('Body: ${convert.jsonDecode(response.data)}');
  }
}
