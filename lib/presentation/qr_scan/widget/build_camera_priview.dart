 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/qr_scan_controller.dart';
import 'build_scan_window.dart';

Column buildCameraPriview(QrScanController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: sizeHeight(70)),
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
      ],
    );
  }
