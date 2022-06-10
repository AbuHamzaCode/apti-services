import 'package:apti_service/interfaces/login_interface.dart';
import 'package:apti_service/models/register_response.dart';
import 'package:dio/dio.dart';

class Api{

  Future<Response> login(String userNameOrEmailAddress, String password) async {
    final api = 'http://api.test.apti.us/api/TokenAuth/Authenticate';
    final data = {"userNameOrEmailAddress": userNameOrEmailAddress, "password": password};

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(api, data: data, options: Options(
          validateStatus: (status) => true
      ));
      final body = response.data;
      //TODO return with model
      return response.data;
    }on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<RegisterResponse> register(String name, String surname, String emailAddress,
      String password, String phoneNumber) async{
    final api = 'http://api.test.apti.us/api/services/app/Account/RegisterFromMobile';
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
      response = await dio.post(api, data: data, options: Options(
          validateStatus: (status) => true,
              headers: {'x-abp-tenantld': 'tenantld'}
      ));
      final body = response.data;
      if(response.statusCode == 200){
        print('true');
      }else {
        print('false');
      }
      return RegisterResponse(canLogin: body['canLogin']);
    }on DioError catch (e) {
      return e.response!.data;
    }
  }
}