import 'dart:io';

import 'package:dio/dio.dart';
import 'package:expense_tracking_app/utils/token_util.dart';

class DioUtil {
  static Dio createDioInstance() {
    var dio = Dio();

    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == HttpStatus.unauthorized) {
            print("unautherr");
            var accessToken = await TokenUtil.getAccessTokenFromSharedPrefs();
            print(accessToken);
            e.requestOptions.headers["Authorization"] =
                "Bearer " + (accessToken);
            final opts = Options(
              method: e.requestOptions.method,
              headers: e.requestOptions.headers,
            );

            final req = await dio.request(
              e.requestOptions.path,
              options: opts,
              data: e.requestOptions.data,
              queryParameters: e.requestOptions.queryParameters,
            );
            return handler.resolve(req);

            // print("unauth");
            // RequestOptions requestOptions = e.requestOptions;

            // var accessToken = await TokenUtil.getAccessTokenFromSharedPrefs();
            // print(accessToken);
            // final opts = Options(method: requestOptions.method);
            // requestOptions.headers["Authorization"] =
            //     "Bearer " + (accessToken);

            // final response = await dio.request(
            //   requestOptions.path,
            //   options: opts,
            //   cancelToken: requestOptions.cancelToken,
            //   data: requestOptions.data,
            //   queryParameters: requestOptions.queryParameters,
            // );
            // print(response);
            // handler.resolve(response);

          }
          // print(e.response?.statusCode);
          handler.next(e);
        },
      ),
    );
    return dio;
  }
}
