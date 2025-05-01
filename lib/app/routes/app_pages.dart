import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/views/splash_view.dart';
import '../modules/home/views/home_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/home', page: () => HomeView()),
  ];
}