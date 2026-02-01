import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/presentation/qr_scan/controller/qr_scan_controller.dart';
import '../widget/build_camera_controller.dart';
import '../widget/build_camera_priview.dart';
import '../widget/build_header.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QrScanController>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context, controller),
            buildCameraPriview(controller, context),
            buildCameraController(controller, context),
          ],
        ),
      ),
    );
  }

  
}
