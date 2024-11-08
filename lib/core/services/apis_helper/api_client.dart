import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // Declare a variable to hold the CancelToken for the current request.
  CancelToken? cancelToken;

  ApiClient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Sending request to: ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('Received response: ${response.statusCode}');
        },
        onError: (error, handler) async {
          int retryCount = 0;
          int maxRetries = 3;
          while (retryCount < maxRetries && error.type == DioExceptionType.connectionTimeout) {
            retryCount++;

            try {
              log('Connection timeout, retrying...');
              final res = await dio.request(error.requestOptions.path);
              return handler.resolve(res);
            } catch (e) {
              log(e.toString());
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  void checkCancelToken() {
    // Check if there is an existing CancelToken and if it has not been canceled.
    if (cancelToken != null && !cancelToken!.isCancelled) {
      // Cancel the previous request if it hasn't been completed yet.
      cancelToken?.cancel('Previous request canceled.');
    }

    // Create a new CancelToken for the current request.
    cancelToken = CancelToken();
  }

  Future<Object?> fetch(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    checkCancelToken();

    try {
      Response response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      final responseData = jsonDecode(response.data);
      return responseData;
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        // Check if the error was due to a canceled request.
        log('Request canceled $e');
      }
      return null;
    } catch (e) {
      log('Error fetching posts: $e');
      return null;
    }
  }

  Future<List<dynamic>> fetchList(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    checkCancelToken();

    try {
      Response response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      final responseData = jsonDecode(response.data);
      return responseData as List<dynamic>;
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        // Check if the error was due to a canceled request.
        log('Request canceled $e');
      }
      return [];
    } catch (e) {
      log('Error fetching posts: $e');
      return [];
    }
  }
}
