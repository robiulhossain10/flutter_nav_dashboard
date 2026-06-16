import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://attendence-expressjs.onrender.com/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Response> getUsers() async {
    return await dio.get('/users');
  }

  Future<Response> getPhotos() async {
    return await dio.get('/photos');
  }

  Future<Response> getATT() async {
    return await dio.get('/attendance/all');
  }
}
