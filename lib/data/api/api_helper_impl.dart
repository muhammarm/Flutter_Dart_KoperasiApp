import 'package:dio/dio.dart';
import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/models/api_response.dart';

class ApiHelperImpl implements ApiHelper{
  ApiHelperImpl._privateConstructor();

  static ApiHelperImpl INSTANCE = ApiHelperImpl._privateConstructor();
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3008'));

  Future<ApiResponse>  postData(String path, Map<String, dynamic> data) async{
    try {
      Response response = await _dio.post(path, data: data);
      if(response.statusCode == 200 || response.statusCode == 201){
        final apiResponse = ApiResponse.fromJson(response.data);
        return apiResponse;
      }else{
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e);
      throw Exception('Could not connect');
    }
  }

  Future<dynamic> getData(String path, {Map<String, dynamic>? queryParameter})async{
    try {
      Response response = await _dio.get(path, queryParameters: queryParameter);
      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Could not connect');
    }
  }


}