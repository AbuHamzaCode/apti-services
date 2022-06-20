import 'package:apti_service/models/register_response.dart';
import 'package:dio/dio.dart';

import '../models/email_verify_code.dart';
import '../models/verify_code.dart';

class RegisterApi {

  static Dio dio = Dio();

  static Future<RegisterResponse> register(
      Map<String, dynamic> registerData) async {
    final api =
        'http://api.test.apti.us/api/services/app/Account/RegisterFromMobile';

    var response = await dio.post(api,
        data: registerData, options: Options(validateStatus: (status) => true));

    print(response.statusCode);

    return RegisterResponse.fromJson(response.data);
  }

  static Future<SendEmailVerificationCode> sendEmailVerificationCode(
      Map<String, dynamic> email) async {
    final api =
        'http://api.test.apti.us/api/services/app/EmailVerifications/SendEmailVerificationCode';

    var response = await dio.post(api,
        data: email, options: Options(validateStatus: (status) => true));

    print(response.statusCode);

    return SendEmailVerificationCode.fromJson(response.data);
  }

  static Future<VerifyEmailVerificationCode> verifyEmailVerificationCode(
      Map<String, dynamic> verifyCodeData) async {
    final api =
        'http://api.test.apti.us/api/services/app/EmailVerifications/VerifyEmailVerificationCode';

    var response = await dio.post(api,
        data: verifyCodeData,
        options: Options(validateStatus: (status) => true));

    print(response.statusCode);

    return VerifyEmailVerificationCode.fromJson(response.data);
  }
}
