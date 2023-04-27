import 'package:dio/dio.dart';
import '../../infra/storage/secure_storage_interface.dart';
import '../enums/http_status_code_enum.dart';
import '../functions/error_snackbar_function.dart';
import 'http_request_interface.dart';

class HttpService {
  final ISecureStorage storage;
  final IHttpRequest httpRequest;

  HttpService({
    required this.storage,
    required this.httpRequest,
  });

  Future<Response?> get(String url) async {
    return await _handleRequest(() => httpRequest.get(url));
  }

  Future<Response?> post(String url, dynamic data) async {
    return await _handleRequest(() => httpRequest.post(url, data));
  }

  Future<Response?> put(String url, dynamic data) async {
    return await _handleRequest(() => httpRequest.put(url, data));
  }

  Future<Response?> _handleRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioError catch (e) {
      if (e.response == null || e.response!.statusCode == 401) {
        await _getTokenFromStorageOrRefresh();
        return await request();
      } else {
        _handleError(e);
        return null;
      }
    }
  }

  Future<String> _getTokenFromStorageOrRefresh() async {
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
    HttpStatusCodeEnum errorType;
    switch (e.response!.statusCode) {
      case 204:
        errorType = HttpStatusCodeEnum.NO_CONTENT;
        break;
      case 303:
        errorType = HttpStatusCodeEnum.REDIRECT;
        break;
      case 400:
        errorType = HttpStatusCodeEnum.BAD_REQUEST;
        break;
      case 401:
        errorType = HttpStatusCodeEnum.UNAUTHORIZED;
        break;
      case 403:
        errorType = HttpStatusCodeEnum.FORBIDDEN;
        break;
      case 404:
        errorType = HttpStatusCodeEnum.NOT_FOUND;
        break;
      case 405:
        errorType = HttpStatusCodeEnum.METHOD_NOT_ALLOWED;
        break;
      case 409:
        errorType = HttpStatusCodeEnum.CONFLICT;
        break;
      case 500:
        errorType = HttpStatusCodeEnum.INTERNAL_SERVER_ERROR;
        break;
      case 502:
        errorType = HttpStatusCodeEnum.BAD_GATEWAY;
        break;
      case 503:
        errorType = HttpStatusCodeEnum.SERVICE_UNAVAILABLE;
        break;
      case 504:
        errorType = HttpStatusCodeEnum.GATEWAY_TIMEOUT;
        break;
      default:
        errorType = HttpStatusCodeEnum.UNKNOWN;
    }
    showErrorSnackBarFunction(errorMessage: errorType.errorMessage);
    //caso o projeto tenha por padrão que as mensagens de erro venham do back,
    //simplesmente exibir na tela:
    // showErrorSnackBarFunction(errorMessage: e.response!.data['message']);
  }
}
