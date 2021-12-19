import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/api/api_helper_impl.dart';
import 'package:koperasi/data/models/auth_data.dart';
import 'package:koperasi/data/repository/auth_repo.dart';
import 'package:koperasi/data/repository/auth_repo_impl.dart';
import 'package:koperasi/kopnigma_app.dart';
import 'package:koperasi/navigation/navigator_service.dart';
import 'package:koperasi/screens/authentication/signin_viewmodel.dart';
import 'package:koperasi/screens/home/home_screen.dart';
import 'package:koperasi/use_cases/user_sign_in.dart';
import 'package:koperasi/utils/screen_state.dart';
import 'package:koperasi/widget/bottom_sheet_dialog.dart';
import 'package:koperasi/widget/failed_notification.dart';
import 'package:koperasi/widget/loader.dart';
import 'package:koperasi/widget/will_pop_notification.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthRepo authRepo;
  late UserSignIn userSignIn;
  ApiHelper apiHelper = ApiHelperImpl.INSTANCE;

  SignInScreen({Key? key}) : super(key: key){
    authRepo = AuthRepoImpl(apiHelper);
    userSignIn = UserSignIn(authRepo);
  }

  _submitForm(BuildContext context) async {
      final userInfoCtx = context.read<SignInViewModel>();
      await userInfoCtx.login(AuthData(usernameController.text, passwordController.text));
      bool? logedIn = userInfoCtx.logedIn;
      if (logedIn == true) {
        Navigator.popAndPushNamed(context, '/app');
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => SignInViewModel(userSignIn),
        child: WillPopScope(
          onWillPop: () async{
            return await willPopExit();
          },
          child: Consumer<SignInViewModel>(
            builder: (context, viewModel, child) {
              return
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg-app.png'),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(  padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  width: 128,
                                  height: 128,
                                  margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                  child: Image.asset(
                                      'assets/images/koperasi_indonesia-logo.png')),
                            ],
                          ),),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(0.5),
                            ),
                            child: Container(width: 350, height: 300,
                            child:  Column(
                              children: [
                                Text('KopNigma', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                Text('Masukkan username dan password anda'),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                                            borderRadius: BorderRadius.circular(28.0)),
                                        hintText: 'Username',
                                        filled: true,
                                        fillColor: Colors.white
                                    ),
                                  controller: usernameController,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField( decoration: InputDecoration(
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                                          borderRadius: BorderRadius.circular(28.0)),
                                      hintText: 'Password',
                                      filled: true,
                                      fillColor: Colors.white
                                  ),
                                    controller: passwordController,
                                    obscureText: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                                  child: SizedBox(
                                    height:50,
                                    width: 370,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(28.0),
                                                side: BorderSide(color: Colors.blueAccent),
                                              )
                                          )
                                      ),
                                      onPressed: (){
                                        _submitForm(context);
                                      },
                                      // onPressed: () {
                                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => KopNigmaApp()));
                                      // },
                                      child: Text('Login', style: TextStyle(fontSize: 18.0),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ) // child widget, replace with your own
                        ),
                      ],
                    ),
                  ),
                  viewModel.screenState.event == ScreenEvent.LOADING ? Loader() : Container(),
                  viewModel.screenState.event == ScreenEvent.FAILED ? const FailedNotification() : Container()
                ],
              );
            },
          ),
        ),
      )

      // Stack(
      //   children: [
      //     Container(
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage('assets/images/bg-app.png'),
      //           fit: BoxFit.cover
      //         )
      //       ),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Padding(  padding: const EdgeInsets.all(16.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 Container(
      //                     width: 128,
      //                     height: 128,
      //                     margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      //                     child: Image.asset(
      //                         'assets/images/koperasi_indonesia-logo.png')),
      //               ],
      //             ),),
      //           SizedBox(
      //             height: 16.0,
      //           ),
      //           Container(
      //               margin: EdgeInsets.all(8),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(8.0),
      //                 color: Colors.white.withOpacity(0.5),
      //               ),
      //               child: Container(width: 350, height: 300,
      //               child:  Column(
      //                 children: [
      //                   Text('KopNigma', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      //                   Text('Masukkan username dan password anda'),
      //                   Padding(
      //                     padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      //                     child: TextField(
      //                       decoration: InputDecoration(
      //                           enabledBorder: OutlineInputBorder(
      //                               borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
      //                               borderRadius: BorderRadius.circular(28.0)),
      //                           hintText: 'Username',
      //                           filled: true,
      //                           fillColor: Colors.white
      //                       ),
      //                     controller: ,
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: TextField( decoration: InputDecoration(
      //                         //border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
      //                         enabledBorder: OutlineInputBorder(
      //                             borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
      //                             borderRadius: BorderRadius.circular(28.0)),
      //                         hintText: 'Password',
      //                         filled: true,
      //                         fillColor: Colors.white
      //                     ),),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
      //                     child: SizedBox(
      //                       height:50,
      //                       width: 370,
      //                       child: ElevatedButton(
      //                         style: ButtonStyle(
      //                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //                                 RoundedRectangleBorder(
      //                                   borderRadius: BorderRadius.circular(28.0),
      //                                   side: BorderSide(color: Colors.blueAccent),
      //                                 )
      //                             )
      //                         ),
      //                         onPressed: () {
      //                           Navigator.push(context, MaterialPageRoute(builder: (context) => KopNigmaApp()));
      //                         },
      //                         child: Text('Login', style: TextStyle(fontSize: 18.0),),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               ) // child widget, replace with your own
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    )
    );
  }
}
