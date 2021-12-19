import 'package:koperasi/data/models/saving_request.dart';
import 'package:koperasi/data/repository/saving_request_repo.dart';
import 'package:koperasi/utils/api_response_status.dart';

class SubmitSavingRequest {
  final SavingRequestRepo savingRequestRepo;


  SubmitSavingRequest(this.savingRequestRepo);

  Future<ApiResponseStatus> call(Saving saving) async {
    return savingRequestRepo.submitSavingRequest(saving);
  }
}
