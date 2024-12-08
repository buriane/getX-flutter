import 'package:get/get.dart';

class ProfileController extends GetxController {
  var email = 'brian.purnama@mhs.unsoed.ac.id'.obs;

  void logout() {
    Get.offAllNamed('/'); // Kembali ke halaman login
  }
}