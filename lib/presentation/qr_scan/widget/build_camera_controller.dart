import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/qr_scan_controller.dart';
import 'build_button_camera_controller.dart';

Column buildCameraController(QrScanController controller, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
  );
}
