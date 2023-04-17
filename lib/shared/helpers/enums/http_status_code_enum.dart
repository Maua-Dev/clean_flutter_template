// ignore_for_file: constant_identifier_names

enum HTTPStatusCodeEnum {
  OK,
  CREATED,
  NO_CONTENT,
  REDIRECT,
  BAD_REQUEST,
  UNAUTHORIZED,
  FORBIDDEN,
  NOT_FOUND,
  METHOD_NOT_ALLOWED,
  CONFLICT,
  INTERNAL_SERVER_ERROR,
  BAD_GATEWAY,
  SERVICE_UNAVAILABLE,
  GATEWAY_TIMEOUT,
}

extension HTTPStatusCodeEnumExtension on HTTPStatusCodeEnum {
  int get statusCode {
    switch (this) {
      case HTTPStatusCodeEnum.OK:
        return 200;
      case HTTPStatusCodeEnum.CREATED:
        return 201;
      case HTTPStatusCodeEnum.NO_CONTENT:
        return 204;
      case HTTPStatusCodeEnum.REDIRECT:
        return 303;
      case HTTPStatusCodeEnum.BAD_REQUEST:
        return 400;
      case HTTPStatusCodeEnum.UNAUTHORIZED:
        return 401;
      case HTTPStatusCodeEnum.FORBIDDEN:
        return 403;
      case HTTPStatusCodeEnum.NOT_FOUND:
        return 404;
      case HTTPStatusCodeEnum.METHOD_NOT_ALLOWED:
        return 405;
      case HTTPStatusCodeEnum.CONFLICT:
        return 409;
      case HTTPStatusCodeEnum.INTERNAL_SERVER_ERROR:
        return 500;
      case HTTPStatusCodeEnum.BAD_GATEWAY:
        return 502;
      case HTTPStatusCodeEnum.SERVICE_UNAVAILABLE:
        return 503;
      case HTTPStatusCodeEnum.GATEWAY_TIMEOUT:
        return 504;
    }
  }
}
