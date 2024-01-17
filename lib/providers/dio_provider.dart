import 'package:dio/dio.dart';
class DioProvider{
  // get token
  Future<dynamic> getToken(String email, String password) async {
    try{
      var response = await Dio().post('http://127.0.0.1:8000/api/login', // http://127.0.0.1:800 Database url and /api/login is the end point
      data: {'email':email,'password':password}
      );
      // if request is successfully, then return token
      if(response.statusCode ==200 && response.data != ''){
        return response.data;
      }
    }catch(error){
      return error;
    }
  }
}