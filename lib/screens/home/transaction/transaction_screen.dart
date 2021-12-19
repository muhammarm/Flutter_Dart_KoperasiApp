import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg-app.png'),
                        fit: BoxFit.cover
                    )),
                child:  Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            'Transaction',
                            style: Theme.of(context).textTheme.headline6
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                                child: Container(height: 100, width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/saving.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(onPressed: (){
                                Navigator.pushNamed(context, '/saving-request');
                              }, child: Text('Saving'))
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50, 32, 32, 32),
                                child: Container(height: 100, width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/loan.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(onPressed: (){}, child: Text('Loan'))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
            )
        ));
  }
}
