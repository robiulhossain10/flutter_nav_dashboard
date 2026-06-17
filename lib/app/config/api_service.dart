import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://appit.ignitetechno.com:8080/ords/xapi/lab',
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
  Future<Response> getHospital() async {
    return await dio.get('/lab_bio');
  }
}
