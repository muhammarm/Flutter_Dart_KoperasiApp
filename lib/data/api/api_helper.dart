import 'package:koperasi/data/models/api_response.dart';

abstract class ApiHelper {
  Future<ApiResponse> postData(String path, Map<String, dynamic> data);
  Future<dynamic> getData(String path, {Map<String, dynamic>? queryParameter});
}