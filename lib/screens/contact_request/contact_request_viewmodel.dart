import 'package:koperasi/data/models/email_template.dart';
import 'package:koperasi/data/models/whatshap_template.dart';
import 'package:koperasi/screens/base_viewmodel.dart';

class ContactRequestViewModel extends BaseViewModel {

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  EmailTemplate get kitaEmailTemplate => EmailTemplate(
      'enigma@enigmacamp.com',
      'Tanya KITA',
      'Halo, nama saya enigmacamp. '
          'Saya ingin menanyakan tentang proses penggunaan dan '
          'pengajuan aplikasi saya, apakah bisa dibantu ?'
          '\n\nTerima Kasih');

  WhatsAppTemplate get kitaWaTemplate => WhatsAppTemplate(
      '6282200',
      'Halo, nama saya enigmacamp. '
          'Saya ingin menanyakan tentang proses penggunaan dan '
          'pengajuan aplikasi saya, apakah bisa dibantu ?');

}