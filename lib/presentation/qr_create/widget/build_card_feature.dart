import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/design/box_decoration_design.dart';
import '../../../core/enum/barcode_type.dart';

Widget buildCardFeature(QrType data, VoidCallback action) {
  return Bounceable(
    onTap: action,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10).w,
      decoration: decorationBox2(),
      child: Column(
        spacing: 10 * ScreenUtil().scaleWidth,
        children: [
          Container(
            padding: EdgeInsets.all(8).w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white),
              gradient: PalletColor().palletGradientBarcode(data),
              boxShadow: [
                BoxShadow(
                  color: PalletColor()
                      .palletGradientBarcode(data)
                      .colors
                      .last
                      // ignore: deprecated_member_use
                      .withOpacity(0.4),
                  offset: Offset(0, 4),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Image.asset(
              'assets/image/${data.name}.png',
              width: size(40),
              color: PalletColor().palletColorBarcode(data),
            ),
          ),
          Text(
            data.name,
            textScaler: TextScaler.linear(scale()),
            style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
