import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/models/saving_request.dart';
import 'package:koperasi/data/repository/saving_request_repo.dart';
import 'package:koperasi/utils/api_response_status.dart';
import 'package:koperasi/utils/string_compare.dart';

class SavingRequestRepoImpl extends SavingRequestRepo{

  ApiHelper apiHelper;

  SavingRequestRepoImpl(this.apiHelper);

  @override
  Future<ApiResponseStatus> submitSavingRequest(Saving saving) async{
    try {
      final savingResponse = await apiHelper.postData(
          '/saving', saving.toMap());

      if (savingResponse.status
          .equalsIgnoreCase(ApiResponseStatus.SUCCESS.toShortString())) {
        return ApiResponseStatus.SUCCESS;
      } else {
        return ApiResponseStatus.ERROR;
      }
    } catch (e) {
      print('error: $e');
      return ApiResponseStatus.ERROR;
    }
  }

}