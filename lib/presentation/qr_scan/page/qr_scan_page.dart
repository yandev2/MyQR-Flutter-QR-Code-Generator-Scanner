import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/core/enum/app_style.dart';
import 'package:myqrcode/presentation/qr_scan/controller/qr_scan_controller.dart';
import '../widget/build_app_bar.dart';
import '../widget/build_button_camera_controller.dart';
import '../widget/build_scan_window.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QrScanController>();

    return Scaffold(
      appBar: buildAppbar(context, controller),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sizeHeight(10)),
            Text.rich(
              TextSpan(
                text: 'Scan ',
                style: TextTheme.of(context).titleLarge?.copyWith(
                  color: PalletColor().palletApp(AppStyle.primary),
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: 'QR Code',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              textScaler: TextScaler.linear(scale()),
            ),
            Text(
              'Position the QR code within the frame ',
              textScaler: TextScaler.linear(scale()),
              style: TextTheme.of(context).bodySmall,
            ),

            SizedBox(height: sizeHeight(40)),
            Center(
              child: SizedBox(
                height: size(250),
                width: size(250),
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: controller.controller,
                      scanWindow: buildScanWindow(MediaQuery.of(context).size),
                      onDetect: (result) async {
                        if (result.barcodes.last.rawValue != null) {
                          if (Get.isDialogOpen == true) return;
                          controller.priviewQr(result);
                        }
                      },
                    ),
                    IgnorePointer(
                      child: SizedBox(
                        height: size(250),
                        width: size(250),
                        child: ClipRect(
                          child: Lottie.asset('assets/lottie/scanner.json', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: sizeHeight(10)),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.zoom.value = (controller.zoom.value - 0.1).clamp(0.0, 1.0);
                    controller.controller.setZoomScale(controller.zoom.value);
                  },
                  icon: Icon(Icons.zoom_out, color: Colors.grey, size: size(25)),
                ),
                Expanded(
                  child: Obx(
                    () => Slider(
                      min: 0,
                      max: 1,
                      divisions: 100,
                      thumbColor: Theme.of(context).primaryColor,
                      activeColor: Theme.of(context).primaryColor,
                      label: 'Zoom ${(controller.zoom.value * 100).round()}%',
                      value: controller.zoom.value,
                      onChanged: (value) {
                        controller.zoom.value = value;
                        controller.controller.setZoomScale(value);
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.zoom.value = (controller.zoom.value + 0.1).clamp(0.0, 1.0);
                    controller.controller.setZoomScale(controller.zoom.value);
                  },
                  icon: Icon(Icons.zoom_in, color: Theme.of(context).primaryColor, size: size(25)),
                ),
              ],
            ),

            SizedBox(height: sizeHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButtonCameraController('Flash', Icons.flash_on, controller.flashOn, () {
                  controller.flashOn.value = !controller.flashOn.value;
                  controller.controller.toggleTorch();
                }),
                buildButtonCameraController('Camera', Icons.camera, controller.isFront, () {
                  controller.isFront.value = !controller.isFront.value;
                  controller.controller.switchCamera();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
