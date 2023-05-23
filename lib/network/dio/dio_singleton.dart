import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practical_5/network/store/http/dio_store.dart';

class SingletonDio {
  static final SingletonDio _instance = SingletonDio._internal();
  SingletonDio._internal();
  factory SingletonDio() => _instance;
  final cookieJar = CookieJar();

  // FutureOr<void> prepareJar() async {
  //   final Directory appDocDir = await getApplicationDocumentsDirectory();
  //   final String appDocPath = appDocDir.path;
  //   final jar = PersistCookieJar(
  //     ignoreExpires: true,
  //     storage: FileStorage('$appDocPath/.cookies/'),
  //   );
  //   debugPrint('Jar is $jar}');
  //   SingletonDio().getDio.interceptors.add(CookieManager(jar));
  // }

  // Dio getDio = Dio(
  //   BaseOptions(
  //     //queryParameters: {'isCompleted': false},
  //     extra: {'name': 'jay'},
  //     sendTimeout: const Duration(microseconds: 5000),
  //     receiveTimeout: const Duration(milliseconds: 5000),
  //     validateStatus: (status) {
  //       if (status != null && status >= 200 && status < 400) {
  //         //debugPrint('Success ::  ');
  //         return true;
  //       }
  //       return false;
  //     },
  //     followRedirects: true,
  //     headers: DioStore.header,
  //     persistentConnection: false,
  //   ),
  // );
  // ..interceptors.add(LogInterceptor());

  Dio getDio = Dio(
    BaseOptions(
      //queryParameters: {'isCompleted': false},
      sendTimeout: const Duration(microseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      validateStatus: (status) {
        if (status != null && status >= 200 && status < 400) {
          //debugPrint('Success ::  ');
          return true;
        }
        return false;
      },
      baseUrl: 'https://6466f9a32ea3cae8dc22d900.mockapi.io/api/v1/',
      followRedirects: true,
      headers: DioStore.header,
      persistentConnection: false,
    ),
  )
    ..interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ))
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (e, handler) {
        debugPrint('Interceptor Wrapper is Called');
        debugPrint(e.data.toString());
        handler.next(e);
      },
    ))
    ..interceptors.add(QueuedInterceptor());
}
