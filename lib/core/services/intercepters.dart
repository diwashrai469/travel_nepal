import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'local_storage.dart';
import 'network_services.dart';

class DioService {
  late final Dio _dio;
  Dio get http => _dio;

  @injectable
  final LocalStorageService _localStorageService;
  DioService(this._localStorageService) {
    _dio = Dio();
    _dio.options.baseUrl = "Add your baseUrl";

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String? token =
              _localStorageService.read(LocalStorageKeys.accessToken);
          if (token != null) {
            options.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          if (e.type == DioExceptionType.badResponse) {
            if (e.response!.statusCode == 401) {
              _localStorageService.clear(LocalStorageKeys.accessToken);

              Future.delayed(const Duration(milliseconds: 100), () {
                //401 Status code mainly refers to unauthorization
                //navigate to login screen or do some action.
              });
            }
          }
          return handler.next(
            NetworkFailure(
                requestOptions: e.requestOptions,
                error: e.error,
                response: e.response,
                type: e.type),
          );
        },
      ),
    );
  }
}
