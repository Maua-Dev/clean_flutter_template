import 'package:dio/dio.dart';

import '../../infra/storage/secure_storage_interface.dart';
import 'http_request_interface.dart';

class HttpService {
  final ISecureStorage storage;
  final IHttpRequest httpRequest;

  HttpService({
    required this.storage,
    required this.httpRequest,
  });

  Future<Response> get(String url) async {
    return await _handleRequest(() => httpRequest.get(url));
  }

  Future<Response> post(String url, dynamic data) async {
    return await _handleRequest(() => httpRequest.post(url, data));
  }

  Future<Response> put(String url, dynamic data) async {
    return await _handleRequest(() => httpRequest.put(url, data));
  }

  Future<Response> _handleRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioError catch (e) {
      if (e.response == null || e.response!.statusCode == 401) {
        await _getTokenFromCacheOrRefresh();
        return await request();
      } else {
        _handleError(e);
        rethrow;
      }
    }
  }

  Future<String> _getTokenFromCacheOrRefresh() async {
    String token = await storage.getRefreshToken();
    if (token.isEmpty) {
      await _refreshToken();
      token = await storage.getRefreshToken();
    }
    return token;
  }

  Future<void> _refreshToken() async {
    storage.saveRefreshToken('validToken');
    // await authController.refreshUserToken();
  }

  void _handleError(DioError e) {
    e.response?.data?.toString() ?? 'Unknown error occurred';
    //showErrorSnackBar(errorMessage: errorMessage);
  }
}
