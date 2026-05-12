import 'package:dio/dio.dart';

class DioClient {
  static Dio? _dio;

  static Dio get instance {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: 'https://api.example.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    return _dio!;
  }
}
