import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:koperasi/screens/authentication/signin_screen.dart';
import 'package:koperasi/screens/contact_request/contact_request_screen.dart';
import 'package:koperasi/screens/home/change_profile/change_profile_screen.dart';
import 'package:koperasi/screens/home/home_screen.dart';
import 'package:koperasi/screens/home/service/service_screen.dart';
import 'package:koperasi/screens/home/transaction/loan/loan_screen.dart';
import 'package:koperasi/screens/home/transaction/saving/saving_screen.dart';
import 'package:koperasi/screens/home/transaction/transaction_screen.dart';
import 'package:koperasi/screens/welcome/onboarding_screen.dart';

import 'kopnigma_app.dart';

final locator = GetIt.instance;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const SignInScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/app': (context) => KopNigmaApp(),
        '/signin': (context) => SignInScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ChangeProfileScreen(),
        '/contact-request': (context) => ContactRequestScreen(),
        '/trx-screen': (context) => TransactionScreen(),
        '/service-screen' : (context) => ServiceScreen(),
        '/saving-request' : (context) => SavingScreen(),
        '/loan-request' : (context) => LoanScreen()
      },
    );
  }
}
