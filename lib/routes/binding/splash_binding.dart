import 'package:get/instance_manager.dart';
import 'package:myqrcode/presentation/splashscreen/controller/splash_screen_controller.dart';
import 'package:myqrcode/service/dependency_service.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DependencyService(), permanent: true);
    Get.put(SplashScreenController());
  }
}
