import 'package:get/get.dart';
import '../views/login_view.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';
import '../views/data_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => LoginView()), //Rute untuk halaman login
    GetPage(name: '/home', page: () => HomeView()), //Rute untuk halaman home
    GetPage(name: '/profile', page: () => ProfileView()), //Rute untuk halaman profile
    GetPage(name: '/data', page: () => DataView()), //Rute untuk halaman data item
  ];
}
