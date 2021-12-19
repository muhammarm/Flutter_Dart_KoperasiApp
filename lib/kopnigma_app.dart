import 'package:flutter/material.dart';
import 'package:koperasi/screens/home/change_profile/change_profile_screen.dart';
import 'package:koperasi/screens/home/home_screen.dart';
import 'package:koperasi/screens/home/service/service_screen.dart';
import 'package:koperasi/screens/home/transaction/transaction_screen.dart';

class KopNigmaApp extends StatefulWidget {
  const KopNigmaApp({Key? key}) : super(key: key);

  @override
  _KopNigmaAppState createState() => _KopNigmaAppState();
}

class _KopNigmaAppState extends State<KopNigmaApp> {

  int _currentPage = 0;
  final List _pages = [HomeScreen(), TransactionScreen(), ServiceScreen(),];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: Text('KopNigma'),),
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          items: const [
            BottomNavigationBarItem(
                label: 'Beranda',
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                label: 'Transaksi',
                icon: Icon(Icons.account_balance_wallet_outlined)
            ),
            BottomNavigationBarItem(
                label: 'Layanan',
                icon: Icon(Icons.menu)
            )
          ],
          onTap: (int index){
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ));
  }
}
