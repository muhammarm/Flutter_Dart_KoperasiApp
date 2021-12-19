
import 'package:koperasi/data/models/saving_request.dart';
import 'package:koperasi/utils/api_response_status.dart';

abstract class SavingRequestRepo {
  Future<ApiResponseStatus> submitSavingRequest(Saving saving);

}
