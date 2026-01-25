import 'package:flutter/material.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/qr_create_controller.dart';

Widget buildFormGeo(BuildContext context, QrCreateController controller) {
  return Column(
    children: [
      Row(
        spacing: size(10),
        children: [
          Expanded(
            child: TextField(
              maxLines: 1,
              controller: controller.textController1,
              keyboardType: TextInputType.number,
              style: TextTheme.of(context).bodyLarge,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Enter your ${controller.qrType.value.name} latitude here',
                hintStyle: TextTheme.of(context).bodyMedium,
                prefixIcon: Container(
                  padding: EdgeInsets.all(size(13)),
                  height: size(10),
                  child: Image.asset(
                    'assets/image/${controller.qrType.value.name}.png',
                    color: PalletColor().palletColorBarcode(controller.qrType.value),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: PalletColor().palletColorBarcode(controller.qrType.value),
                  ),
                ),
                contentPadding: EdgeInsets.all(size(10)),
              ),
            ),
          ),

          Expanded(
            child: TextField(
              maxLines: 1,
              controller: controller.textController2,
              keyboardType: TextInputType.number,
              style: TextTheme.of(context).bodyLarge,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Enter your ${controller.qrType.value.name} longitude here',
                hintStyle: TextTheme.of(context).bodyMedium,
                prefixIcon: Container(
                  padding: EdgeInsets.all(size(13)),
                  height: size(10),
                  child: Image.asset(
                    'assets/image/${controller.qrType.value.name}.png',
                    color: PalletColor().palletColorBarcode(controller.qrType.value),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: PalletColor().palletColorBarcode(controller.qrType.value),
                  ),
                ),
                contentPadding: EdgeInsets.all(size(10)),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: size(10)),
      TextField(
        maxLines: 5,
        controller: controller.textController3,
        keyboardType: TextInputType.streetAddress,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your ${controller.qrType.value.name} longitude here',
          hintStyle: TextTheme.of(context).bodyMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: PalletColor().palletColorBarcode(controller.qrType.value),
            ),
          ),
          contentPadding: EdgeInsets.all(size(10)),
        ),
      ),
    ],
  );
}
