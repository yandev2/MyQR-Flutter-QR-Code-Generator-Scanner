import 'package:get/get.dart';
import 'package:myqrcode/presentation/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
