import 'package:apti_service/interfaces/login_interface.dart';
import 'package:apti_service/models/register_response.dart';
import 'package:dio/dio.dart';

class Api {
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

  Future<Response> register(String name, String surname, String emailAddress,
      String password, String phoneNumber) async {
    final api =
        'http://api.test.apti.us/api/services/app/Account/RegisterFromMobile';
    final data = {
      "name": name,
      "surname": surname,
      "emailAddress": emailAddress,
      "password": password,
      "phoneNumber": phoneNumber,
    };
    final dio = Dio();
    Response response;
    try {
      response = await dio.post(api,
          data: data,
          options: Options(validateStatus: (status) => true, headers: {
            'accept': 'text/plain',
            'Content-Type': 'application/json-patch+json',
            'x-abp-tenantld': 'tenantld',
            'X-XSRF-TOKEN': 'null'
          }));
      // if (response.statusCode == 200) {
      //   print('true');
      // } else {
      //   print(response.data['success']);
      //   print(response.statusCode);
      // }
      return response.data['canLogin'];
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
// xYhSQFJsp7UulzQZTAewYLYT6+7HZoEHjOdL72FxExIkiBJoUDRXwuvZhHLA8uqeDvCjmE89N4akU+KVNthBfA==
  Future<dynamic> sendEmailForVerify(String email) async {
    final api =
        'http://api.test.apti.us/api/services/app/EmailVerifications/SendEmailVerificationCode';
    final data = {"email": email};

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(api,
          data: data,
          options: Options(validateStatus: (status) => true, headers: {
            'accept': 'text/plain',
            'Content-Type': 'application/json-patch+json',
            'X-XSRF-TOKEN': 'null'
          }));
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
      } else {
        print(response.statusCode);
      }
      return response.data['result'];
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> responseHandler(dynamic code, String attemptId) async {
    final api =
        'http://api.test.apti.us/api/services/app/EmailVerifications/VerifyEmailVerificationCode';
    final data = {
      "attemptId": attemptId,
      "code": code
    };

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(api,
          data: data,
          options: Options(validateStatus: (status) => true, headers: {
            'accept': 'text/plain',
            'Content-Type': 'application/json-patch+json',
            'X-XSRF-TOKEN': 'null'
          }));
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
      } else {
        print(response.statusCode);
      }
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
