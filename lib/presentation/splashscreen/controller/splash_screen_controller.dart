import 'package:get/get.dart';
import 'package:myqrcode/routes/route_app/route_name.dart';
import 'package:myqrcode/service/dependency_service.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    loadApp();
    super.onInit();
  }

  final dep = Get.find<DependencyService>();

  Future loadApp() async {
    await Future.delayed(Duration(seconds: 2));
    final isOpen = await dep.pref.getString('isOpen');
    if (isOpen == null) {
      Get.toNamed(RouteName.introduction);
    } else {
      Get.offNamed(RouteName.home);
    }
  }

  Future saveStatus() async {
    final result = await dep.pref.addString('ready', 'isOpen');
    if (result == true) {
      Get.offAllNamed(RouteName.home);
    }
  }
}
