import 'package:flutter/material.dart';
import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/api/api_helper_impl.dart';
import 'package:koperasi/data/models/user_profile.dart';
import 'package:koperasi/data/repository/user_profile_repo.dart';
import 'package:koperasi/data/repository/user_profile_repo_impl.dart';
import 'package:koperasi/screens/home/change_profile/change_profile_viewmodel.dart';
import 'package:koperasi/use_cases/user_update.dart';
import 'package:koperasi/utils/screen_state.dart';
import 'package:koperasi/widget/failed_notification.dart';
import 'package:koperasi/widget/form_button.dart';
import 'package:koperasi/widget/loader.dart';
import 'package:koperasi/widget/navigation_header.dart';
import 'package:koperasi/widget/notification_screen.dart';
import 'package:koperasi/widget/text_field.dart';
import 'package:koperasi/widget/will_pop_notification.dart';
import 'package:provider/provider.dart';

class ChangeProfileScreen extends StatefulWidget {
  late UserProfileRepo userProfileRepo;
  late UserUpdate userUpdate;
  ApiHelper apiHelper = ApiHelperImpl.INSTANCE;

  ChangeProfileScreen({Key? key}) : super(key: key) {
    userProfileRepo = UserProfileRepoImpl(apiHelper);
    userUpdate = UserUpdate(userProfileRepo);
  }

  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController motherMaidenController = TextEditingController();
  TextEditingController fixedIncomeController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();

  int currentNavigation = 0;

  _setUpFormData(BuildContext context) async {
    final userInfoCtx = context.watch<ChangeProfileViewmodel>();
    final userProfile = userInfoCtx.userProfile;
    if (userProfile != null) {
      nameController.text = userProfile.name;
      genderController.text = userProfile.gender;
      emailController.text = userProfile.email;
      addressController.text = userProfile.address;
      dateOfBirthController.text = userProfile.dateOfBirth;
      maritalStatusController.text = userProfile.maritalStatus ?? '';
      statusController.text = userProfile.status;
      educationController.text = userProfile.education;
      phoneController.text = userProfile.phone;
      religionController.text = userProfile.religion;
      motherMaidenController.text = userProfile.motherMaiden;
      fixedIncomeController.text = userProfile.fixedIncome;
      placeOfBirthController.text = userProfile.placeOfBirth;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  _submitProfileUpdate(BuildContext context) async {
    final changeProfileViewmodel = context.read<ChangeProfileViewmodel>();
    final userProfile = UserProfile(
        '1',
        nameController.text,
        genderController.text,
        emailController.text,
        addressController.text,
        dateOfBirthController.text,
        maritalStatusController.text,
        statusController.text,
        educationController.text,
        phoneController.text,
        religionController.text,
        motherMaidenController.text,
        fixedIncomeController.text,
        placeOfBirthController.text);
    await changeProfileViewmodel.submitUpdateProfile(userProfile);
    if (changeProfileViewmodel.statusUpdated != null ||
        changeProfileViewmodel.statusUpdated == 1) {
      setState(() {
        currentNavigation = 1;
      });
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
                create: (_) => ChangeProfileViewmodel(widget.userUpdate),
                builder: (context, viewModel) {
                  return Consumer<ChangeProfileViewmodel>(
                      builder: (context, viewModel, child) {
                    return Stack(children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bg-app.png'),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: _buildChangeProfileFormNavigation(context),
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

  Widget _buildChangeProfileFormNavigation(BuildContext context) {
    switch (currentNavigation) {
      case 1:
        return InkWell(
          onTap: () {
            Navigator.pop(context, 'DONE');
          },
          child: NotificationScreen(
            title: 'Your Data successfully change !!!',
            checkImage: 'success.png',
          ),
        );
      default:
        //_syncData(context);
        _setUpFormData(context);
        return _buildChangeProfileForm(context);
    }
  }

  Widget _buildChangeProfileForm(BuildContext context) {
    return Consumer<ChangeProfileViewmodel>(
        builder: (context, viewModel, child) {
      return Column(
        children: [
          NavigationHeader(
              title: 'Ubah Data Diri',
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
                    title: 'Nama Lengkap',
                    controller: nameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Gender',
                    controller: genderController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Email',
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Address',
                    controller: addressController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Date Of Birth',
                    controller: dateOfBirthController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Place Of Birth',
                    controller: placeOfBirthController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Marital Status',
                    controller: maritalStatusController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Status',
                    controller: statusController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Education',
                    controller: educationController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Phone',
                    controller: phoneController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Religion',
                    controller: religionController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    isDisabled: false,
                    title: 'Mother Maiden',
                    controller: motherMaidenController,
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
                          _submitProfileUpdate(context);
                        }),
                  ),
                )
        ],
      );
    });
  }
}
