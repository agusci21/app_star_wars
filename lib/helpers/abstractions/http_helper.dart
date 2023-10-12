abstract class HttpHelper {
  Future<HttpResponse<T>> post<T>(
    String path, {
    data,
  });

  Future<HttpResponse<T>> put<T>(
    String path, {
    data,
  });

  Future<HttpResponse<T>> get<T>(String url, {Map<String, dynamic>? query});

  Future<HttpResponse<T>> patch<T>(
    String url, {
    data,
  });

  Future<HttpResponse<T>> delete<T>(
    String url, {
    data,
  });
}

class HttpResponse<T> {
  late final T? _data;
  late final int? _statusCode;
  late final HttpError? _httpError;

  HttpResponse(T? data, int? statusCode) {
    _data = data;
    _statusCode = statusCode;
    _httpError =
        statusCode == null ? null : _getHttpErrorFromStatusCode(statusCode);
  }

  T? get data => _data;
  int? get statusCode => _statusCode;
  HttpError? get httpError => _httpError;

  bool get isOk => _statusCode.toString().startsWith('2');

  HttpError? _getHttpErrorFromStatusCode(int statusCode) {
    final errorsMap = {
      400: HttpError.badRequest,
      500: HttpError.internalServerError,
      404: HttpError.notFound,
      405: HttpError.methodNotAllowed,
      401: HttpError.unauthorized,
      403: HttpError.forbidden
    };

    return errorsMap[statusCode];
  }
}

enum HttpError {
  badRequest,
  internalServerError,
  notFound,
  unauthorized,
  forbidden,
  methodNotAllowed
}
