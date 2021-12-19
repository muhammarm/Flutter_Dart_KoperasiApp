import 'package:flutter/material.dart';
import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/api/api_helper_impl.dart';
import 'package:koperasi/data/models/saving_request.dart';
import 'package:koperasi/data/repository/saving_request_repo.dart';
import 'package:koperasi/data/repository/saving_request_repo_impl.dart';
import 'package:koperasi/screens/home/transaction/saving/saving_viewmodel.dart';
import 'package:koperasi/use_cases/submit_saving_request.dart';
import 'package:koperasi/utils/screen_state.dart';
import 'package:koperasi/widget/failed_notification.dart';
import 'package:koperasi/widget/form_button.dart';
import 'package:koperasi/widget/loader.dart';
import 'package:koperasi/widget/navigation_header.dart';
import 'package:koperasi/widget/notification_screen.dart';
import 'package:koperasi/widget/text_field.dart';
import 'package:koperasi/widget/will_pop_notification.dart';
import 'package:provider/provider.dart';

class SavingScreen extends StatefulWidget {
  late SavingRequestRepo savingRequestRepo;
  late SubmitSavingRequest submitSavingRequest;
  ApiHelper apiHelper = ApiHelperImpl.INSTANCE;
  SavingScreen({Key? key}) : super(key: key){
    savingRequestRepo = SavingRequestRepoImpl(apiHelper);
    submitSavingRequest = SubmitSavingRequest(savingRequestRepo);
  }

  @override
  _SavingScreenState createState() => _SavingScreenState();
}

class _SavingScreenState extends State<SavingScreen> {

  TextEditingController sourceFundController = TextEditingController();
  TextEditingController fixedIncomeController = TextEditingController();
  TextEditingController variableIncomeController = TextEditingController();
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController tenorController = TextEditingController();
  TextEditingController interestMethodController = TextEditingController();
  TextEditingController benefNameController = TextEditingController();
  TextEditingController benefPhoneController = TextEditingController();
  TextEditingController benefPobController = TextEditingController();
  TextEditingController benefDobController = TextEditingController();
  TextEditingController benefStreetController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  int currentNavigation = 0;

  _submitSavingRequest(BuildContext context) async {
    final savingViewmodel = context.read<SavingViewModel>();
    final saving = Saving(
        int.parse(sourceFundController.text),
        int.parse(fixedIncomeController.text),
        int.parse(variableIncomeController.text),
        int.parse(depositAmountController.text),
        int.parse(tenorController.text),
        int.parse(interestMethodController.text),
        benefNameController.text,
        benefPhoneController.text,
        int.parse(benefPobController.text),
        benefDobController.text,
        benefStreetController.text);
    await savingViewmodel.submitUpdateProfile(saving);
    if (savingViewmodel.statusSubmitted != null ||
        savingViewmodel.statusSubmitted == 1) {
      setState(() {
        currentNavigation = 1;
      });
    }
  }

  Widget _buildSavingFormNavigation(BuildContext context) {
    switch (currentNavigation) {
      case 1:
        return InkWell(
          onTap: () {
            Navigator.pop(context, 'DONE');
          },
          child: NotificationScreen(
            title: 'Saving Request Done !!!',
            checkImage: 'success.png',
          ),
        );
      default:
      //_syncData(context);
        return _buildSavingForm(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await willPopNotification(
            context, 'Ingin keluar dari halaman ini ?');
      },
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: ChangeNotifierProvider(
                create: (_) => SavingViewModel(widget.submitSavingRequest),
                builder: (context, viewModel) {
                  return Consumer<SavingViewModel>(
                      builder: (context, viewModel, child) {
                        return Stack(children: [
                          Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/bg-app.png'),
                                    fit: BoxFit.fill)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: _buildSavingFormNavigation(context),
                            ),
                          ),
                          viewModel.screenState.event == ScreenEvent.LOADING
                              ? Loader()
                              : Container(),
                          viewModel.screenState.event == ScreenEvent.FAILED
                              ? const FailedNotification()
                              : Container()
                        ]);
                      });
                },
              ))),
    );
  }


  Widget _buildSavingForm(BuildContext context) {
    return Consumer<SavingViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              NavigationHeader(
                  title: 'Saving Request',
                  actionCallback: () async {
                    await willPopNotification(
                        context, 'Ingin keluar dari halaman ini?');
                  }),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Source Fund',
                        controller: sourceFundController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Fixed Income',
                        controller: fixedIncomeController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Variable Income',
                        controller: variableIncomeController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Deposit Amount',
                        controller: depositAmountController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Tenor',
                        controller: tenorController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Interest Method',
                        controller: interestMethodController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Beneficary Name',
                        controller: benefNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Beneficary Phone',
                        controller: benefPhoneController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Beneficary POB',
                        controller: benefPobController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Beneficary DOB',
                        controller: benefDobController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                        isDisabled: false,
                        title: 'Beneficary Street',
                        controller: benefStreetController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: KaskitaFormButton(
                      title: 'Submit',
                      actionCallback: () {
                        _submitSavingRequest(context);
                      }),
                ),
              )
            ],
          );
        });
  }
}
