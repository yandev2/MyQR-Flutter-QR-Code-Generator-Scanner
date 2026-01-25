import 'package:get/get.dart';
import 'package:myqrcode/presentation/home/page/home_page.dart';
import 'package:myqrcode/presentation/qr_create/page/qr_form_generate_page.dart';
import 'package:myqrcode/presentation/splashscreen/page/introduction_page.dart';
import 'package:myqrcode/presentation/splashscreen/page/splash_screen_page.dart';
import 'package:myqrcode/routes/binding/home_binding.dart';
import 'package:myqrcode/routes/route_app/route_name.dart';

class RouteApp {
  static final route = [
    GetPage(name: RouteName.splashscreen, page: () => SplashScreenPage()),
    GetPage(name: RouteName.introduction, page: () => IntroductionPage()),
    GetPage(name: RouteName.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: RouteName.createqr, page: () => QrFormGeneratePage()),
  ];
}
