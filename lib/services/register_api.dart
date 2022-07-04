import 'package:apti_service/models/response_models/register_response.dart';
import 'package:apti_service/utils/endpoints.dart';
import 'package:dio/dio.dart';

import '../models/response_models/email_verify_code.dart';
import '../models/response_models/verify_code.dart';

class RegisterApi {
  static Dio dio = Dio();

  static Future<RegisterResponse> register({
    required String name,
    required String surname,
    required String email,
    required String password,
    required String phone,
  }) async {
    Map<String, dynamic> data = {
      "name": name,
      "surname": surname,
      "emailAddress": email,
      "password": password,
      "phoneNumber": phone
    };
    var response = await dio.post(Endpoints.registerURL,
        data: data, options: Options(validateStatus: (status) => true));
    if (response.statusCode == 200)
      print("true: Email is available");
    else
      print("false: Email not available");

    return RegisterResponse.fromJson(response.data);
  }

  static Future<SendEmailVerificationCode> sendEmailVerificationCode(
      {required String email}) async {
    Map<String, dynamic> emailData = {"email": email};
    var response = await dio.post(Endpoints.sendEmailURL,
        data: emailData, options: Options(validateStatus: (status) => true));

    if (response.statusCode == 200)
      print("Email is verify");
    else
      print("Failed: Email not verify");

    return SendEmailVerificationCode.fromJson(response.data);
  }

  static Future<VerifyEmailVerificationCode> verifyEmailVerificationCode(
      {required String attemptId, required String code}) async {
    Map<String, dynamic> data = {"attemptId": attemptId, "code": code};
    var response = await dio.post(Endpoints.verifyEmailURL,
        data: data, options: Options(validateStatus: (status) => true));

    if (response.statusCode == 200)
      print("Verify code is correct");
    else
      print("Failed: Verify code not correct");

    return VerifyEmailVerificationCode.fromJson(response.data);
  }
}
