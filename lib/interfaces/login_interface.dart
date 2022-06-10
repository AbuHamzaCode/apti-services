import 'package:dio/dio.dart';

abstract class ILogin {

  Future<void> login(String userNameOrEmailAddress, String password) async {
    final api = 'http://api.test.apti.us/api/TokenAuth/Authenticate';
    final data = {"userNameOrEmailAddress": userNameOrEmailAddress, "password": password};

    final dio = Dio();
    Response response;

    response = await dio.post(api, data: data, options: Options(
        validateStatus: (status) => true
    ));
    if (response.statusCode == 401) {
      print("Success");
    }else {
      print("Error");
    }
  }
}
