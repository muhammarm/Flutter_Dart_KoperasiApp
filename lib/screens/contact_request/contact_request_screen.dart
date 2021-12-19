import 'package:flutter/material.dart';
import 'package:koperasi/screens/contact_request/contact_request_viewmodel.dart';
import 'package:koperasi/widget/bottom_sheet_dialog.dart';
import 'package:koperasi/widget/menu_icon_button.dart';
import 'package:koperasi/widget/navigation_header.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactRequestScreen extends StatefulWidget {
  const ContactRequestScreen({Key? key}) : super(key: key);

  @override
  _ContactRequestScreenState createState() => _ContactRequestScreenState();
}

class _ContactRequestScreenState extends State<ContactRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: ChangeNotifierProvider(
            create: (_) => ContactRequestViewModel(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg-app.png'),
                  fit: BoxFit.fill,
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NavigationHeader(
                      title: 'FAQ',
                      actionCallback: () {
                        Navigator.of(context).pop();
                      }),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/faq.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<ContactRequestViewModel>(
                        builder: (context, viewmodel, child) {
                          return MenuIconButton(
                              title: 'WhatsApp',
                              iconData: Icons.local_phone_outlined,
                              actionCallback: () async {
                                final whatsappUrlAndroid =
                                    'whatsapp://send?phone=' +
                                        viewmodel.kitaWaTemplate.waNumber +
                                        '&text=${viewmodel.kitaWaTemplate.waText}';
                                if (await canLaunch(whatsappUrlAndroid)) {
                                  await launch(whatsappUrlAndroid);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('whatsapp no installed')));
                                }
                              });
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 96),
                      child: Consumer<ContactRequestViewModel>(
                        builder: (context, viewmodel, child) {
                          return MenuIconButton(
                              title: 'Email',
                              iconData: Icons.email_outlined,
                              actionCallback: () async {
                                EmailContent email = EmailContent(
                                  to: [
                                    viewmodel.kitaEmailTemplate.kitaEmail,
                                  ],
                                  subject: viewmodel.kitaEmailTemplate.emailSubject,
                                  body: viewmodel.kitaEmailTemplate.emailBody,
                                );
                                OpenMailAppResult result =
                                await OpenMailApp.composeNewEmailInMailApp(
                                    nativePickerTitle:
                                    'Select email app to compose',
                                    emailContent: email);
                                if (!result.didOpen && !result.canOpen) {
                                  showButtomSheetDialog(
                                      context,
                                      'Aplikasi Email tidak ditemukan',
                                      DialogType.INFO,
                                      null,
                                          () {},
                                      imageName: 'assets/images/green-check.png');
                                } else if (!result.didOpen && result.canOpen) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => MailAppPickerDialog(
                                      mailApps: result.options,
                                      emailContent: email,
                                    ),
                                  );
                                }
                              });
                        },
                      )),
                ],
              ),
            ),
          ),
        )
    );
  }
}
