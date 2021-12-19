import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koperasi/widget/bottom_sheet_dialog.dart';
import 'package:koperasi/widget/menu_icon_button.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Layanan',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                        Container(
                        width: 128.0,
                        height: 128.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                                'assets/images/bill.jpg')
                                .image,
                            )
                          ),
                        ),
                      Center(child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/profile');
                        }, child: Text('Enigmacamp'),
                      )),
                      SizedBox(height: 100,),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MenuIconButton(
                            title: 'FAQ',
                            iconData: Icons.question_answer_outlined,
                            actionCallback: () {
                              Navigator.pushNamed(
                                  context, '/contact-request');
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MenuIconButton(
                            title: 'Keluar',
                            iconData: Icons.logout,
                            actionCallback: () {
                              showButtomSheetDialog(
                                  context,
                                  'Kamu Ingin Keluar ?',
                                  DialogType.EXIT,
                                  null, () async {
                                final response = true;
                                if (response == true) {
                                  Navigator.popAndPushNamed(
                                      context, '/signin');
                                } else {
                                  showButtomSheetDialog(
                                      context,
                                      'Oops..terjadi kendala teknis',
                                      DialogType.INFO,
                                      null,
                                          () {},
                                      imageName:
                                      'assets/images/exit_confirmation_2.png');
                                }
                              },
                                  imageName:
                                  'assets/images/confirmation.png');
                            },
                          )
                      ),
                    ],
                    )
                  ),
                ],
              )
            )
        ));
  }
}
