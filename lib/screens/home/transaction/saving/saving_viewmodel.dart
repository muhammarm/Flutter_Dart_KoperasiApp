import 'package:koperasi/data/models/saving_request.dart';
import 'package:koperasi/screens/base_viewmodel.dart';
import 'package:koperasi/use_cases/submit_saving_request.dart';
import 'package:koperasi/utils/api_response_status.dart';
import 'package:koperasi/utils/screen_state.dart';

class SavingViewModel extends BaseViewModel{
  SubmitSavingRequest submitSavingRequest;

  SavingViewModel(this.submitSavingRequest);

  int? _statusSubmitted;

  int? get statusSubmitted => _statusSubmitted;

  Saving? _saving;

  Saving? get saving => _saving;

  submitUpdateProfile(Saving saving) async {
    print('Saving request');
    print(saving);
    try {
      setScreenState(ScreenState.loading());
      await submitSavingRequest.call(saving);
      _statusSubmitted = 1;
      setScreenState(ScreenState.idle());
    } catch (e) {
      setScreenState(ScreenState.idle());
      setScreenState(ScreenState.failed(e.toString()));
    }
  }
}