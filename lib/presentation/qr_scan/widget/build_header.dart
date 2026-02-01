import 'package:flutter/material.dart';

import '../../../core/color/pallet_color.dart';
import '../../../core/design/responsif_design.dart';
import '../../../core/enum/app_style.dart';
import '../../../core/widget/icon_button_widget.dart';
import '../controller/qr_scan_controller.dart';

Column buildHeader(BuildContext context, QrScanController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: sizeHeight(10)),
      Row(
        children: [
          Expanded(
            child: Text.rich(
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
          ),
          IconButtonWidget(
            icon: Icons.add_a_photo_outlined,
            action: () {
              controller.scanForImageFile();
            },
          ),
        ],
      ),
      Text(
        'Position the QR code within the frame ',
        textScaler: TextScaler.linear(scale()),
        style: TextTheme.of(context).bodySmall,
      ),
    ],
  );
}
