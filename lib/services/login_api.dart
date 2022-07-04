import 'package:apti_service/models/response_models/register_response.dart';
import 'package:dio/dio.dart';

import '../models/response_models/email_verify_code.dart';
import '../models/response_models/login_response_success.dart';
import '../models/response_models/verify_code.dart';

class LoginApi {
  static Dio dio = Dio();

  static Future<LoginResponseSuccess> login(
      Map<String, dynamic> loginData) async {
    final api = 'http://api.test.apti.us/api/TokenAuth/Authenticate';

    var response = await dio.post(
        api,
        data: loginData,
        options: Options(validateStatus: (status) => true));

    print(response.statusCode);

    return LoginResponseSuccess.fromJson(response.data);
  }
}
