import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/widget/bg_app_widget.dart';
import 'package:myqrcode/presentation/home/controller/home_controller.dart';
import 'package:myqrcode/presentation/qr_create/page/qr_create_page.dart';
import 'package:myqrcode/presentation/qr_recent/page/qr_recent_page.dart';
import 'package:myqrcode/presentation/qr_scan/page/qr_scan_page.dart';

import '../widget/build_widget_navigationbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: BgApp(
        child: Stack(
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            Obx(() {
              if (controller.indexMenu.value == 0) {
                return QrScanPage();
              } else if (controller.indexMenu.value == 1) {
                return QrCreatePage();
              } else {
                return QrRecentPage();
              }
            }),
      
            buildWidgetNavigationbar(controller),
          ],
        ),
      ),
    );
  }
}
