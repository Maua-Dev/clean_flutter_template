import 'package:dio/dio.dart';

BaseOptions userOptions = BaseOptions(
  baseUrl: 'baseurl',
  responseType: ResponseType.json,
  connectTimeout: const Duration(milliseconds: 30000),
  receiveTimeout: const Duration(milliseconds: 30000),
);
