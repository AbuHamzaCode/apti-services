
import 'package:apti_service/models/register_response.dart';
import 'package:dio/dio.dart';

import '../models/email_verify_code.dart';
import '../models/verify_code.dart';

class LoginApi {

  static Dio dio = Dio();

  Future<Response> login(String userNameOrEmailAddress, String password) async {
    final api = 'http://api.test.apti.us/api/TokenAuth/Authenticate';
    final data = {
      "userNameOrEmailAddress": userNameOrEmailAddress,
      "password": password
    };

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(api,
          data: data, options: Options(validateStatus: (status) => true));
      final body = response.data;
      //TODO return with model
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }






}
