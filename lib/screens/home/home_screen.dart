import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg-app.png'),
                        fit: BoxFit.cover
                    )
                ),
                    child:  Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Beranda',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        const Image(image: AssetImage('assets/images/home.png')),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Container(height: 100, width: 120,
                                 child: Column(
                                   children: [
                                     IconButton(
                                        icon: const Icon(Icons.credit_card),
                                        tooltip: 'Transaction',
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/trx-screen');
                                        },
                                      ),
                                     Text('Transaction')
                                   ],
                                 ),
                               decoration: BoxDecoration(
                                 shape: BoxShape.rectangle,
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.lightGreen,
                                 boxShadow: [
                                   BoxShadow(color: Colors.green, spreadRadius: 3),
                                 ],
                               ),
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 32, 32, 32),
                              child: Container(height: 100, width: 120,
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.contact_page),
                                      tooltip: 'Layanan',
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/service-screen');
                                      },
                                    ),
                                    Text('Layanan')
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orangeAccent,
                                  boxShadow: [
                                    BoxShadow(color: Colors.orange, spreadRadius: 3),
                                  ],
                                ),
                                ),
                            )
                          ],
                        )
                      ],
                    )
            )
        )
     );
  }
}
