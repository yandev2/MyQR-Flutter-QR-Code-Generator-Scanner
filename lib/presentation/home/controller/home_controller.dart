import 'package:get/get.dart';
import 'package:myqrcode/presentation/qr_create/controller/qr_create_controller.dart';
import 'package:myqrcode/presentation/qr_recent/controller/qr_recent_controller.dart';
import 'package:myqrcode/presentation/qr_scan/controller/qr_scan_controller.dart';

class HomeController extends GetxController {
  final indexMenu = 1.obs;

  Future<void> changeMenu(int index) async {
    switch (index) {
      case 0:
        disposeController();
        Get.put(QrScanController());
        indexMenu.value = 0;
        break;
      case 1:
        disposeController();
        Get.put(QrCreateController());
        indexMenu.value = 1;
        break;
      case 2:
        disposeController();
        Get.put(QrRecentController());
        indexMenu.value = 2;
        break;
    }
  }

  Future<void> disposeController() async {
    final index = indexMenu.value;
    await Future.delayed(Duration(milliseconds: 200));
    switch (index) {
      case 0:
        Get.delete<QrScanController>();
        break;
      case 1:
        Get.delete<QrCreateController>();
        break;
      case 2:
        Get.delete<QrRecentController>();
        break;
    }
  }

  @override
  void onInit() {
    Get.put(QrCreateController());
    super.onInit();
  }
}
