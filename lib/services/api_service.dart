import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();
  Response? response;

  Future<Response> login(String userNameOrEmailAddress, String password) async {
    try{
      Response response = await _dio.post(
        'http://api.test.apti.us/api/TokenAuth/Authenticate',
        data: {
          'password' : password,
          'userNameOrEmailAddress' : userNameOrEmailAddress
        },
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}