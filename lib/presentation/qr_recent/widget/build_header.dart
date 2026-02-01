import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myqrcode/presentation/qr_recent/controller/qr_recent_controller.dart';

import '../../../core/color/pallet_color.dart';
import '../../../core/design/box_decoration_design.dart';
import '../../../core/design/responsif_design.dart';
import '../../../core/enum/app_style.dart';
import '../../../core/widget/dialog_app_widget.dart';

Padding buildHeader(BuildContext context, QrRecentController controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size(15)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: sizeHeight(10)),
        Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: 'Recent ',
                  style: TextTheme.of(context).titleLarge?.copyWith(
                    color: PalletColor().palletApp(AppStyle.primary),
                    fontSize: 30,
                  ),
                  children: [
                    TextSpan(
                      text: 'QR',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                textScaler: TextScaler.linear(scale()),
              ),
            ),
            Bounceable(
              onTap: () => showGWDialog(
                title: 'Delete all',
                message: 'Continue deleting all history?',
                style: AppStyle.danger,
                onRight: () => controller.deleteAllRecent(),
              ),
              child: Container(
                padding: EdgeInsets.all(5).w,
                decoration: decorationBox().copyWith(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  spacing: size(5),
                  children: [
                    Icon(Icons.delete_forever, color: PalletColor().palletApp(AppStyle.danger)),
                    Text(
                      'Delete All',
                      textScaler: TextScaler.linear(scale()),
                      style: TextTheme.of(context).bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Text(
          'History generate your qr',
          textScaler: TextScaler.linear(scale()),
          style: TextTheme.of(context).bodySmall,
        ),
      ],
    ),
  );
}
