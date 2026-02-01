import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/design/box_decoration_design.dart';
import 'package:myqrcode/core/enum/app_style.dart';
import 'package:myqrcode/presentation/qr_create/controller/qr_create_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/design/responsif_design.dart';

SliverList buildCollaborate(QrCreateController controller, BuildContext context) {
  return SliverList.list(
    children: [
      Bounceable(
        onTap: () => controller.contackEmail(),
        child: Container(
          padding: EdgeInsets.all(15).w,
          decoration: decorationBox2(),
          child: Row(
            spacing: size(15),
            children: [
              Image.asset('assets/image/email.png', width: size(20)),
              Shimmer(
                gradient: LinearGradient(
                  colors: [
                    PalletColor().palletApp(AppStyle.primary),
                    PalletColor().palletApp(AppStyle.warning),
                    PalletColor().palletApp(AppStyle.primary),
                    PalletColor().palletApp(AppStyle.warning),
                  ],
                ),
                child: Text(
                  'collaborate with me!',
                  textScaler: TextScaler.linear(scale()),
                  style: TextTheme.of(context).bodyLarge,
                ),
              ),
              Spacer(),
              Icon(Icons.send, color: PalletColor().palletApp(AppStyle.primary), size: size(20)),
            ],
          ),
        ),
      ),
      SizedBox(height: size(25)),
    ],
  );
}
