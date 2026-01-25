import 'package:flutter/material.dart';
import '../../../core/design/responsif_design.dart';
import '../../../core/widget/icon_button_widget.dart';
import '../controller/qr_scan_controller.dart';

AppBar buildAppbar(BuildContext context, QrScanController controller) {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: size(80),
    title: Text.rich(
      textScaler: TextScaler.linear(scale()),
      TextSpan(
        text: 'My',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w900,
          fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
        ),
        children: [
          TextSpan(
            text: 'QR',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    ),
    actions: [
      IconButtonWidget(
        icon: Icons.add_a_photo_outlined,
        action: () {
          controller.scanForImageFile();
        },
      ),
      SizedBox(width: size(15)),
    ],
  );
}
